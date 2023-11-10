const sql = require("mssql/msnodesqlv8");

const createPool = require("../db");
const {
  ValueDoesntExistsInDatabaseError,
  MissingFiledsError,
  ValidationError,
} = require("../error");

// CURRENT DATE
const currDate = getCurrentDate();

// QUERYS
const selectCategoriesWithImages = `
  SELECT
    c.id_category,
    c.category_name,
    c.id_cat_parent,
    ci.src
    FROM categories c
  INNER JOIN category_images ci ON c.id_category = ci.id_category
`;

// ASYNC FUNCTIONS

async function getCategories(req, res) {
  try {
    const { categoryId } = req.params;

    const pool = await createPool();

    if (categoryId === "undefined") {
      const result = await pool.query(`
              ${selectCategoriesWithImages}
              WHERE c.id_cat_parent IS NULL
          `);

      const primaryCategories = result.recordset;
      res.status(200).json(primaryCategories);
    } else {
      const result = await pool
        .request()
        .input("categoryId", sql.SmallInt(), categoryId).query(`
        ${selectCategoriesWithImages}
        WHERE c.id_category = @categoryId
        `);
      const parentId = result.recordset[0].id_cat_parent;

      let result2;
      if (parentId === null) {
        result2 = await pool.query(`
       ${selectCategoriesWithImages}
      WHERE c.id_cat_parent IS NULL
      `);
      } else {
        result2 = await pool
          .request()
          .input("parentId", sql.SmallInt(), parentId).query(`
        ${selectCategoriesWithImages}
        WHERE c.id_cat_parent = @parentId
        `);
      }

      const categories = result2.recordset;

      res.status(200).json(categories);
    }
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getCategory(req, res) {
  try {
    const { categoryId } = req.params;

    if (categoryId === "undefined") {
      throw new MissingFiledsError("Category id is unknown, try again!", 400);
    }

    const pool = await createPool();

    const result1 = await pool
      .request()
      .input("categoryId", sql.SmallInt(), categoryId).query(`
      SELECT COUNT(*) AS categoryExists
      FROM categories
      WHERE id_category = @categoryId
    `);
    const catExists = result1.recordset[0].categoryExists;

    if (catExists === 0) {
      throw new ValueDoesntExistsInDatabaseError(
        "Category doesn't exists in database!",
        400
      );
    }

    const result2 = await pool
      .request()
      .input("categoryId", sql.SmallInt(), categoryId).query(`
      ${selectCategoriesWithImages}
      WHERE id_cat_parent = @categoryId
    `);

    const subCategories = result2.recordset;

    if (subCategories.length > 0) {
      res.status(200).json({ products: false, subCategories });
    } else {
      res.status(200).json({ products: true });
    }
  } catch (err) {
    if (err instanceof ValidationError || MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function getCategoryProducts(req, res) {
  try {
    let { categories, userId } = req.body;

    if (categories.length === 0) {
      throw new MissingFiledsError("Category is unknown, try again!", 400);
    }

    // if (categoryId === 0) {
    //   throw new ValidationError("Category id is 0, try again!", 400);
    // }

    const pool = await createPool();

    // Conctruct an array for parameters for the IN clause
    const categoryIdParameters = categories.map((categoryId, i) => ({
      name: `categoryId${i}`,
      type: sql.SmallInt(),
      value: categoryId,
    }));

    // Construct the SQL query with dynamic parameters
    const query = `SELECT
    p.id_product,
    p.product_name,
    pi.src,
    STRING_AGG(t.tag_name, ',') AS tag_names,
    pr.product_price,
    dp.discount_price,
    dp.discount_value,
    dp.saved,
    ${
      userId
        ? `CONVERT(BIT, CASE WHEN wp.id_product IS NOT NULL THEN 1 ELSE 0 END) AS in_wishlist,`
        : `CONVERT(BIT, 0) AS in_wishlist,`
    }
    b.brand_name,
    b.id_brand,
    c.category_name,
    c.id_category,
    p.avg_rating
    FROM products p
    INNER JOIN  product_images pi ON p.id_product = pi.id_product
    INNER JOIN cat_brands cb ON cb.id_cat_brand = p.id_cat_brand
    INNER JOIN categories c ON cb.id_category = c.id_category
    INNER JOIN brands b ON cb.id_brand = b.id_brand
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
    SELECT pt1.id_product, t.tag_name
    FROM products_tags pt1
    LEFT JOIN tags t ON t.id_tag = pt1.id_tag
    WHERE pt1.product_tag_active = 1
  ) t ON p.id_product = t.id_product
  LEFT JOIN wishlists_products wp ON p.id_product = wp.id_product
  LEFT JOIN wishlists w ON wp.id_wishlist = w.id_wishlist ${
    userId ? `AND w.id_user = '${userId}'` : ``
  }
  WHERE c.id_category IN (${categoryIdParameters
    .map((param) => `@${param.name}`)
    .join(",")})
    GROUP BY
    p.id_product,
    p.product_name,       
    pi.src,       
    pr.product_price,
    dp.discount_price,
    dp.discount_value,
    dp.saved,
    ${userId ? `wp.id_product,` : ""}
    b.brand_name,
    b.id_brand,
    c.category_name,
    c.id_category,
    p.avg_rating
    `;

    // Create a request and add the parameters
    const request = pool.request();
    categoryIdParameters.forEach((param) => {
      request.input(param.name, param.type, param.value);
    });

    // Execute the query
    const result = await request.query(query);

    const products = result.recordset;

    res.status(200).json(products);
  } catch (err) {
    if (err instanceof ValidationError || err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function getAllCategories(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT 
        c1.id_category, 
        c1.category_name,
        COUNT(p.id_product) AS product_count
      FROM categories c1
      LEFT JOIN categories c2 ON c1.id_category = c2.id_cat_parent
      LEFT JOIN cat_brands cb ON c1.id_category = cb.id_category
      LEFT JOIN products p ON cb.id_cat_brand = p.id_cat_brand
      WHERE c2.id_category IS NULL
      GROUP BY
        c1.id_category,
        c1.category_name
    `);

    const categories = result.recordset;

    res.status(200).json(categories);
  } catch (err) {
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
  getCategories,
  getCategory,
  getCategoryProducts,
  getAllCategories,
};
