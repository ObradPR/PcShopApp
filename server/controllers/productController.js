const sql = require("mssql/msnodesqlv8");

const createPool = require("../db");
const {
  ValueDoesntExistsInDatabaseError,
  MissingFiledsError,
  ValidationError,
} = require("../error");

// CurrentDate
const currDate = getCurrentDate();

// ASYNC
async function getSingleProduct(req, res) {
  try {
    const { productName, userId } = req.params;

    if (!productName)
      throw new MissingFiledsError("Product doesn't exists, try again", 404);

    const pool = await createPool();

    const result = await pool
      .request()
      .input("productName", sql.NVarChar(), productName).query(`
      SELECT
        p.id_product,
        p.product_name,
        pi.src,  
        CASE
          WHEN pt.product_tag_active = 'True' THEN STRING_AGG(t.tag_name, ',')
          ELSE NULL
        END AS tag_names,
        pr.product_price,
        dp.discount_price,
        dp.discount_value,
        dp.saved,
        p.avg_rating,
        ${
          +userId
            ? `CONVERT(BIT, CASE WHEN wp.id_product IS NOT NULL THEN 1 ELSE 0 END) AS in_wishlist`
            : `CONVERT(BIT, 0) AS in_wishlist`
        }
      FROM products p
      INNER JOIN product_images pi ON p.id_product = pi.id_product
      LEFT JOIN (
        SELECT id_product, product_price
        FROM prices
        WHERE price_date_till IS NULL
          AND price_date_from <= '${currDate}'
      ) pr ON p.id_product = pr.id_product
      OUTER APPLY(
        SELECT TOP 1 dp.discount_price, dp.discount_value, dp.saved
        FROM discount_prices dp
        INNER JOIN prices pr2 ON dp.id_price = pr2.id_price
        INNER JOIN discount_durations dd ON dp.id_discount_duration = dd.id_discount_duration
        WHERE pr2.id_product = p.id_product
          AND dd.discount_date_from <= '${currDate}'
          AND dd.discount_date_till > '${currDate}'
        ORDER BY dd.discount_date_from DESC
      ) dp
      LEFT JOIN (
        SELECT pt1.*
        FROM products_tags pt1
        LEFT JOIN products_tags pt2 ON pt1.id_product = pt2.id_product
        AND pt1.product_tag_date_till < pt2.product_tag_date_till
        WHERE pt2.id_product IS NULL
      ) pt ON p.id_product = pt.id_product
      LEFT JOIN tags t ON t.id_tag = pt.id_tag
      LEFT JOIN wishlists_products wp ON p.id_product = wp.id_product
      LEFT JOIN wishlists w ON wp.id_wishlist = w.id_wishlist ${
        +userId ? `AND w.id_user = '${userId}'` : ``
      }
      WHERE p.product_name LIKE @productName
      GROUP BY        
        p.id_product,
        p.product_name,       
        pi.src,         
        pt.product_tag_active,
        pr.product_price,
        dp.discount_price,
        dp.discount_value,
        dp.saved,
        p.avg_rating,
        ${userId ? `wp.id_product` : ""}
    `);

    const product = result.recordset[0];

    res.status(200).json({ message: "Successfully got product", product });
  } catch (err) {
    if (err instanceof (ValidationError || MissingFiledsError)) {
      errorHandler(err, res);
    }
    internalServerError(err, res);
  }
}

async function getInfo(req, res) {
  try {
    const { productId } = req.params;

    if (!productId) throw new MissingFiledsError("Product doesn't exists", 404);

    const pool = await createPool();

    const specs = await pool.request().input("productId", sql.Int(), productId)
      .query(`
      SELECT
        ps.product_spec_value,
        s.spec_name,
        s.spec_measurement_unit
      FROM products_specifications ps
      INNER JOIN specifications s ON ps.id_spec = s.id_spec
      WHERE ps.id_product = @productId;
    `);

    const specifications = specs.recordset;

    const revRat = await pool.request().input("productId", sql.Int(), productId)
      .query(`
      SELECT
        r.comment,
        r.review_date,
        rt.rating,
        u.first_name,
        u.last_name
      FROM users u
      INNER JOIN reviews r ON u.id_user = r.id_user AND r.id_product = @productId
      INNER JOIN ratings rt ON u.id_user = rt.id_user AND rt.id_product = @productId;
    `);

    const reviewsRatings = revRat.recordset;

    res.status(200).json({
      message: "Successfully got specification",
      specifications,
      reviewsRatings,
    });
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    }
    internalServerError(err, res);
  }
}

// ========================

function errorHandler(err, res) {
  console.log(`Error: ${err}`);
  res.status(err.status).json({ message: err.message });
}

function internalServerError(err, res) {
  console.log(err);
  res.status(500).json({ message: "Internal server error" });
}

function getCurrentDate() {
  const currDate = new Date();

  const year = currDate.getFullYear();
  const month = String(currDate.getMonth() + 1).padStart(2, "0");
  const day = String(currDate.getDate()).padStart(2, "0");

  const formattedDate = `${year}-${month}-${day}`;

  return formattedDate;
}

module.exports = {
  getSingleProduct,
  getInfo,
};
