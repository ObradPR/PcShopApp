const express = require("express");
const cartController = require("../controllers/cartController");

const router = express.Router();

router.route("/set-product-in-cart").post(cartController.setProductInCart);
router.route("/delete-cart/:cartId").delete(cartController.deleteCart);

module.exports = router;
