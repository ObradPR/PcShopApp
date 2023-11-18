const express = require("express");
const cartController = require("../controllers/cartController");

const router = express.Router();

router.route("/set-product-in-cart").post(cartController.setProductInCart);
router.route("/delete-cart/:cartId").delete(cartController.deleteCart);
router.route("/cart-items/:userId/:cartId").get(cartController.getCartItems);

module.exports = router;
