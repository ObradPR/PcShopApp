const express = require("express");
const wishlistController = require("../controllers/wishlistController");

const router = express.Router();

router
  .route("/wishlist-items/:userId")
  .get(wishlistController.getWishlistItems);
router
  .route("/remove-item-wishlist/:userId/:productId")
  .delete(wishlistController.removeItemFromWishlist);
router.route("/add-item-wishlist").post(wishlistController.addItemToWishlist);

module.exports = router;
