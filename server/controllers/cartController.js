const sql = require("mssql/msnodesqlv8");

const createPool = require("../db");
const { ValidationError, MissingFiledsError } = require("../error");

// CurrentDate
const currDate = getCurrentDate();

// ASYNC FUNCTIONS
async function placeOrder(req, res) {
  try {
    const { fullName, address, city, paymentType, cart } = req.body;

    const pool = await createPool();

    await pool
      .request()
      .input("fullName", sql.NVarChar(), fullName)
      .input("address", sql.NVarChar(), address)
      .input("city", sql.SmallInt(), city)
      .input("paymentType", sql.TinyInt(), paymentType)
      .input("cart", sql.Int(), cart).query(`
          INSERT INTO orders(id_cart, id_payment_type, order_date, order_address, id_city, id_order_status, recipient_name)
          VALUES (@cart, @paymentType, '${currDate}', @address, @city, 1, @fullName)
        `);

    await pool.request().input("cart", sql.Int(), cart).query(`
        UPDATE carts
        SET id_cart_status = 2
        WHERE id_cart = @cart;
      `);

    res.status(201).json({ message: "Success!" });
  } catch (err) {
    internalServerError(err, res);
  }
}

async function setProductInCart(req, res) {
  try {
    const { productId, userId, cartId } = req.body;

    if (!productId) {
      throw new MissingFiledsError("Product doesn't exists!");
    }

    const pool = await createPool();

    if (!userId && !cartId) {
      const result = await pool.query(`
            INSERT INTO carts(id_cart_status)
            OUTPUT inserted.id_cart
            VALUES(3)
      `);

      const cartIdForUser = result.recordsets.flat()[0].id_cart;

      await pool
        .request()
        .input("cartId", sql.Int(), cartIdForUser)
        .input("productId", sql.Int(), productId).query(`
          INSERT INTO cart_items(id_cart, id_product, amount)
          VALUES(@cartId, @productId, 1)
        `);

      res.status(201).json({
        message: "Successfully added to cart!",
        cartId: cartIdForUser,
      });
    } else if (!userId) {
      const result = await pool
        .request()
        .input("cartId", sql.Int(), cartId)
        .input("productId", sql.Int(), productId).query(`
          SELECT id_item, amount
          FROM cart_items
          WHERE id_cart = @cartId AND id_product = @productId;
        `);

      const existingCartItem = result.recordsets.flat()[0];

      const itemId = existingCartItem?.id_item;

      if (typeof itemId === "number") {
        const newAmount = +existingCartItem.amount + 1;

        await pool
          .request()
          .input("cartId", sql.Int(), cartId)
          .input("productId", sql.Int(), productId)
          .input("amount", sql.TinyInt(), newAmount).query(`
          UPDATE cart_items
          SET amount = @amount
          WHERE id_cart = @cartId AND id_product = @productId;
        `);
      } else {
        await pool
          .request()
          .input("cartId", sql.Int(), cartId)
          .input("productId", sql.Int(), productId).query(`
          INSERT INTO cart_items(id_cart, id_product, amount)
          VALUES(@cartId, @productId, 1)
      `);
      }

      res.status(201).json({ message: "Successfully added to cart!" });
    } else if (userId && !cartId) {
      const result = await pool.request().input("userId", sql.Int(), userId)
        .query(`
        SELECT id_cart
        FROM carts
        WHERE id_user = @userId;
      `);

      let userCartId = result.recordsets.flat()[0]?.id_cart;

      if (!userCartId) {
        const result2 = await pool.request().input("userId", sql.Int(), userId)
          .query(`
          INSERT INTO carts(id_user, id_cart_status)
          OUTPUT inserted.id_cart
          VALUES(@userId, 3);
        `);

        userCartId = result2.recordsets.flat()[0].id_cart;
      }

      const result3 = await pool
        .request()
        .input("cartId", sql.Int(), userCartId)
        .input("productId", sql.Int(), productId).query(`
          SELECT id_item, amount
          FROM cart_items
          WHERE id_cart = @cartId AND id_product = @productId;
        `);

      const existingCartItem = result3.recordsets.flat()[0];

      const itemId = existingCartItem?.id_item;

      if (typeof itemId === "number") {
        const newAmount = +existingCartItem.amount + 1;

        await pool
          .request()
          .input("cartId", sql.Int(), userCartId)
          .input("productId", sql.Int(), productId)
          .input("amount", sql.TinyInt(), newAmount).query(`
            UPDATE cart_items
            SET amount = @amount
            WHERE id_cart = @cartId AND id_product = @productId;
          `);
      } else {
        await pool
          .request()
          .input("cartId", sql.Int(), userCartId)
          .input("productId", sql.Int(), productId).query(`
            INSERT INTO cart_items(id_cart, id_product, amount)
            VALUES(@cartId, @productId, 1)
          `);
      }

      res.status(201).json({ message: "Successfully added to cart!" });
    }
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function deleteCart(req, res) {
  try {
    const { cartId } = req.params;

    const pool = await createPool();
    const transaction = new sql.Transaction(pool);

    await transaction.begin();

    try {
      const request = new sql.Request(transaction);
      request.input("cartId", sql.Int(), cartId);

      // Define the SQL query with both DELETE statements
      const query = `
        DELETE FROM cart_items
        WHERE id_cart = @cartId;

        DELETE FROM carts
        WHERE id_cart = @cartId;
      `;

      // Execute the query within the transaction
      const result = await request.query(query);

      // Commit the transaction if successful
      await transaction.commit();

      // Check if the deletion was successful
      if (result.rowsAffected[0] > 0) {
        res.status(200).json({ message: "Deletion successful" });
      } else {
        res.status(404).json({ message: "Cart not found" });
      }
    } catch (error) {
      // If an error occurs during the query execution, roll back the transaction
      await transaction.rollback();
      throw error; // Re-throw the error for the outer catch block
    }
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getCartItems(req, res) {
  try {
    const { userId, cartId } = req.params;

    let cartItems = [];
    let cartStats;

    const pool = await createPool();

    if (!+cartId && +userId) {
      // If user is logged we send cartId only from localstorage
      // when the user is not logged on
      const result = await pool.request().input("userId", sql.Int(), userId)
        .query(`
        SELECT
          ci.id_item,
          ci.amount,
          ci.item_price,
          p.product_name,
          p.avg_rating,
          p.count_reviews,
          p.id_product,
          pi.src,
          pr.product_price,
          dp.discount_price,
          dp.discount_value,
          dp.saved,
          c.id_cart
        FROM cart_items ci
        INNER JOIN carts c ON ci.id_cart = c.id_cart
        INNER JOIN cart_status cs ON cs.id_cart_status = c.id_cart_status
        INNER JOIN products p ON p.id_product = ci.id_product
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
        WHERE id_user = @userId AND c.id_cart_status != 1 AND c.id_cart_status != 2;
      `);

      cartItems = result.recordset;

      const result2 = await pool.request().input("userId", sql.Int(), userId)
        .query(`
          SELECT c.cart_price, cs.cart_status
          FROM carts c
          INNER JOIN cart_status cs ON c.id_cart_status = cs.id_cart_status
          WHERE c.id_user = @userId AND c.id_cart_status != 1 AND c.id_cart_status != 2;
      `);

      cartStats = result2.recordset[0];
    } else if (+cartId && !+userId) {
      // If user is not logged we sent cartId from localstorage
      const result = await pool.request().input("cartId", sql.Int(), cartId)
        .query(`
        SELECT
          ci.id_item,
          ci.amount,
          ci.item_price,
          p.product_name,
          p.avg_rating,
          p.count_reviews,
          p.id_product,
          pi.src,
          pr.product_price,
          dp.discount_price,
          dp.discount_value,
          dp.saved,
          c.id_cart
        FROM cart_items ci
        INNER JOIN carts c ON ci.id_cart = c.id_cart
        INNER JOIN cart_status cs ON cs.id_cart_status = c.id_cart_status
        INNER JOIN products p ON p.id_product = ci.id_product
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
        WHERE c.id_cart = @cartId AND c.id_cart_status != 1 AND c.id_cart_status != 2;
      `);

      cartItems = result.recordset;

      const result2 = await pool.request().input("cartId", sql.Int(), cartId)
        .query(`
          SELECT c.cart_price, cs.cart_status
          FROM carts c
          INNER JOIN cart_status cs ON c.id_cart_status = cs.id_cart_status
          WHERE c.id_cart = @cartId AND c.id_cart_status != 1 AND c.id_cart_status != 2;
      `);

      cartStats = result2.recordset[0];
    }

    res.status(200).json({ cartItems, cartStats });
  } catch (err) {
    internalServerError(err, res);
  }
}

async function deleteCartItem(req, res) {
  try {
    const { itemId } = req.params;

    const pool = await createPool();

    await pool.request().input("itemId", sql.Int(), itemId).query(`
        DELETE FROM cart_items
        WHERE id_item = @itemId;
    `);

    res.status(200).json({ message: "Successfully removed item!" });
  } catch (err) {
    internalServerError(err, res);
  }
}

async function updateItemAmount(req, res) {
  try {
    const { howMuch, itemId } = req.body;

    const pool = await createPool();

    const result = await pool.request().input("itemId", sql.Int(), itemId)
      .query(`
          SELECT amount
          FROM cart_items
          WHERE id_item = @itemId;
        `);

    const amount = result.recordset[0].amount;

    const newAmount = amount + +howMuch;

    await pool
      .request()
      .input("amount", sql.Int(), newAmount)
      .input("itemId", sql.Int(), itemId).query(`
      UPDATE cart_items
      SET amount = @amount
      WHERE id_item = @itemId;
    `);

    res.status(200).json({ message: "Successfully changed item amount!" });
  } catch (err) {
    internalServerError(err, res);
  }
}

// =============================

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
  setProductInCart,
  deleteCart,
  getCartItems,
  deleteCartItem,
  updateItemAmount,
  placeOrder,
};
