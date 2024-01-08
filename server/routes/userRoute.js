const express = require("express");
const userController = require("../controllers/userController");

const router = express.Router();

router.route("/register").post(userController.registerUser);
router.route("/login").post(userController.loginUser);
router.route("/edit-user").patch(userController.editUser);
router.route("/get-messages/:id").get(userController.getUserMessages);
router.route("/read-message").patch(userController.readMessage);

module.exports = router;
