const express = require("express");
const homeController = require("../controllers/homeController");
const upload = require("../multerConfig");

const router = express.Router();

router
  .route("/featured-products/:userId")
  .get(homeController.getFeaturedProducts);
router.route("/testimonials").get(homeController.getTestimonials);
router
  .route("/rent-offer")
  .post(upload.array("files", 2), homeController.postRentOffer);
router.route("/contact").post(homeController.postContactMessage);
router.route("/faqs").get(homeController.getFaqs);
router.route("/repair-service").get(homeController.getRepairServices);
router.route("/stores").get(homeController.getStoresInfo);
router.route("/payment-types").get(homeController.getPaymentTypes);

module.exports = router;
