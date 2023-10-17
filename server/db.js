const sql = require("mssql/msnodesqlv8");
const config = require("./config");

async function createPool() {
  try {
    const pool = await sql.connect(config.config);
    return pool;
  } catch (err) {
    console.log("Error connecting to the database:", err);
    throw err;
  }
}

module.exports = createPool;
