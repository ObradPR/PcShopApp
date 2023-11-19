const express = require("express");
const cartController = require("../controllers/cartController");

const router = express.Router();

router.route("/set-product-in-cart").post(cartController.setProductInCart);
router.route("/delete-cart/:cartId").delete(cartController.deleteCart);
router.route("/delete-cart-item/:itemId").delete(cartController.deleteCartItem);
router.route("/cart-items/:userId/:cartId").get(cartController.getCartItems);
router.route("/update-item-amount").patch(cartController.updateItemAmount);

module.exports = router;
