const express = require("express");
const shopController = require("../controllers/shopController");

const router = express.Router();

router.route("/get-categories/:categoryId").get(shopController.getCategories);
router.route("/get-category/:categoryId").get(shopController.getCategory);
router
  .route("/get-category-products")
  .post(shopController.getCategoryProducts);
router.route("/get-all-categories").get(shopController.getAllCategories);

module.exports = router;
