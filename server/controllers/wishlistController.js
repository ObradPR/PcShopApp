const sql = require("mssql/msnodesqlv8");

const createPool = require("../db");
const { ValidationError, MissingFiledsError } = require("../error");

// CurrentDate
const currDate = getCurrentDate();

// ========
// ASYNC FUNCTIONS

async function getWishlistItems(req, res) {
  try {
    let { userId } = req.params;
    userId = +userId;

    if (+userId === 0) {
      throw new ValidationError("The user id is 0", 400);
    }
    if (userId === undefined) {
      throw new MissingFiledsError("The user id is missing!", 400);
    }

    const pool = await createPool();

    const result = await pool.request().input("userId", sql.Int(), userId)
      .query(`
            SELECT
            w.wishlist_date,
            p.product_name,
            p.product_description,
            p.avg_rating,
            p.count_reviews,
            p.id_product,
            pi.src,
            pr.product_price,
            dp.discount_price,
            dp.discount_value,
            dp.saved
        FROM wishlists w
        INNER JOIN wishlists_products wp ON w.id_wishlist = wp.id_wishlist
        INNER JOIN products p ON wp.id_product = p.id_product
        INNER JOIN product_images pi ON p.id_product = pi.id_product
        LEFT JOIN (
            SELECT 
                id_product, 
                product_price
            FROM prices
            WHERE price_date_till IS NULL
            AND price_date_from <= '${currDate}'
        ) pr ON p.id_product = pr.id_product
        OUTER APPLY (
            SELECT TOP 1
                dp.discount_price, 
                dp.discount_value, 
                dp.saved
            FROM discount_prices dp
            INNER JOIN prices pr2 ON dp.id_price = pr2.id_price
            INNER JOIN discount_durations dd ON dp.id_discount_duration = dd.id_discount_duration
            WHERE pr2.id_product = p.id_product
            AND dd.discount_date_from <= '${currDate}'
            AND dd.discount_date_till > '${currDate}'
            ORDER BY dd.discount_date_from DESC
        ) dp
        WHERE id_user = @userId
      `);

    const wishlistItems = result.recordset;

    res.status(200).json(wishlistItems);
  } catch (err) {
    if (err instanceof ValidationError || err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function removeItemFromWishlist(req, res) {
  try {
    const { userId, productId } = req.params;

    if (+userId === 0 || +productId === 0) {
      throw new ValidationError("The user id or product id are 0!", 400);
    }

    if (userId === undefined || productId === undefined) {
      throw new MissingFiledsError(
        "The user id or product id are missing!",
        400
      );
    }
    const pool = await createPool();

    await pool
      .request()
      .input("userId", sql.Int(), userId)
      .input("productId", sql.Int(), productId).query(`
        DELETE wp
        FROM wishlists_products wp
        INNER JOIN wishlists w ON wp.id_wishlist = w.id_wishlist
        WHERE wp.id_product = @productId AND w.id_user = @userId
    `);

    const result = await pool.request().input("userId", sql.Int(), userId)
      .query(`
      SELECT COUNT(*) as totalCount
      FROM wishlists_products wp
      INNER JOIN wishlists w ON wp.id_wishlist = w.id_wishlist
      WHERE id_user = @userId
    `);

    const countNum = result.recordset[0].totalCount;

    if (countNum === 0) {
      await pool.request().input("userId", sql.Int(), userId).query(`
        DELETE FROM wishlists
        WHERE id_user = @userId
      `);
    }

    res
      .status(201)
      .json({ message: "Successfully removed the item from wishlist!" });
  } catch (err) {
    if (err instanceof ValidationError || err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError;
    }
  }
}

async function addItemToWishlist(req, res) {
  try {
    const { productId, userId } = req.body;

    if (productId === 0 || userId === 0) {
      throw new ValidationError("Product id or user id are 0!", 400);
    }

    if (productId === undefined || userId === undefined) {
      throw new MissingFiledsError("Missing product id or user id!", 400);
    }

    const pool = await createPool();

    const result1 = await pool.request().input("userId", sql.Int(), userId)
      .query(`
      DECLARE @userWishlistCount INT;
      SELECT @userWishlistCount = COUNT(*)
      FROM wishlists
      WHERE id_user = @userId;

      IF @userWishlistCount = 0
        BEGIN
          INSERT INTO wishlists(id_user)
          OUTPUT INSERTED.id_wishlist
          VALUES(@userId);
        END
      ELSE
        BEGIN
          SELECT id_wishlist
          FROM wishlists
          WHERE id_user = @userId;
        END
    `);

    const wishlistId = result1.recordset[0].id_wishlist;

    await pool
      .request()
      .input("productId", sql.Int(), productId)
      .input("wishlistId", sql.Int(), wishlistId).query(`
        INSERT INTO wishlists_products(id_wishlist, id_product)
        VALUES(@wishlistId, @productId)
    `);

    res
      .status(201)
      .json({ message: "Successfully added product to your wishlist!" });
  } catch (err) {
    if (err instanceof ValidationError || err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

// =====================

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
  getWishlistItems,
  removeItemFromWishlist,
  addItemToWishlist,
};
