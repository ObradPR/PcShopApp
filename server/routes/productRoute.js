const express = require("express");
const productController = require("../controllers/productController");

const router = express.Router();

router
  .route("/single-product/:productName/:userId")
  .get(productController.getSingleProduct);
router
  .route("/specifications/:productId")
  .get(productController.getSpecifications);

module.exports = router;
