const sql = require("mssql/msnodesqlv8");

const createPool = require("../db");
const { ValidationError, MissingFiledsError } = require("../error");

// CurrentDate
const currDate = getCurrentDate();

// ASYNC FUNCTIONS
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
};
