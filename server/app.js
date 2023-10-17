const express = require("express");
const morgan = require("morgan");
const cors = require("cors");

const homeRoute = require("./routes/homeRoute");
const userRoute = require("./routes/userRoute");
const wishlistRoute = require("./routes/wishlistRoute");
const shopRoute = require("./routes/shopRoute");

const app = express();

// MIDDLEWARE

if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
}

// Body parser
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));

// Enable CORS for all routes
app.use(cors());

// ROUTES
app.use("/", homeRoute);
app.use("/user", userRoute);
app.use("/wishlist", wishlistRoute);
app.use("/shop", shopRoute);

module.exports = app;
