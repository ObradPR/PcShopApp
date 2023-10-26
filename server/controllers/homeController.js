const sql = require("mssql/msnodesqlv8");
const sharp = require("sharp");

const createPool = require("../db");
const {
  nameRegex,
  phoneRegex,
  positiveNumberRegex,
  squareFootageRegex,
} = require("../regex");
const { ValidationError, MissingFiledsError } = require("../error");
const { config } = require("../config");

// CurrentDate
const currDate = getCurrentDate();

// REGEX FUNCTIONS
function isValidName(name) {
  return nameRegex.test(name);
}
function isValidPhone(phone) {
  return phoneRegex.test(phone);
}
function isValidPositiveNumber(num) {
  return positiveNumberRegex.test(num);
}
function isValidSquareFootage(footage) {
  return squareFootageRegex.test(footage);
}

// ASYNC FUNCTIONS
async function getFeaturedProducts(req, res) {
  try {
    const { userId } = req.params;

    const pool = await createPool();

    const result = await pool.query(`
      SELECT
        p.id_product,
        p.product_name,
        pi.src,  
        fp.priority,
        CASE
          WHEN pt.product_tag_active = 'True' THEN STRING_AGG(t.tag_name, ',')
          ELSE NULL
        END AS tag_names,
        pr.product_price,
        dp.discount_price,
        dp.discount_value,
        dp.saved,
        CONVERT(BIT, CASE WHEN wp.id_product IS NOT NULL THEN 1 ELSE 0 END) AS in_wishlist
      FROM featured_products fp
      INNER JOIN products p ON p.id_product = fp.id_product
      INNER JOIN product_images pi ON p.id_product = pi.id_product
      LEFT JOIN (
        SELECT id_product, product_price
        FROM prices
        WHERE price_date_till IS NULL
          AND price_date_from <= '${currDate}'
      ) pr ON p.id_product = pr.id_product
      OUTER APPLY(
        SELECT TOP 1 dp.discount_price, dp.discount_value, dp.saved
        FROM discount_prices dp
        INNER JOIN prices pr2 ON dp.id_price = pr2.id_price
        INNER JOIN discount_durations dd ON dp.id_discount_duration = dd.id_discount_duration
        WHERE pr2.id_product = p.id_product
          AND dd.discount_date_from <= '${currDate}'
          AND dd.discount_date_till > '${currDate}'
        ORDER BY dd.discount_date_from DESC
      ) dp
      LEFT JOIN (
        SELECT pt1.*
        FROM products_tags pt1
        LEFT JOIN products_tags pt2 ON pt1.id_product = pt2.id_product
        AND pt1.product_tag_date_till < pt2.product_tag_date_till
        WHERE pt2.id_product IS NULL
      ) pt ON p.id_product = pt.id_product
      LEFT JOIN tags t ON t.id_tag = pt.id_tag
      LEFT JOIN wishlists_products wp ON p.id_product = wp.id_product
      LEFT JOIN wishlists w ON wp.id_wishlist = w.id_wishlist AND w.id_user = '${userId}'
      WHERE fp.featured_date_till > '${currDate}'
      GROUP BY        
        p.id_product,
        p.product_name,       
        pi.src,      
        fp.priority,       
        pt.product_tag_active,
        pr.product_price,
        dp.discount_price,
        dp.discount_value,
        dp.saved,
        wp.id_product
      ORDER BY fp.priority;
    `);
    const featuredProducts = result.recordset;

    res.status(200).json(featuredProducts);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getTestimonials(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT
        company_name,
        customer_position,
        customer_name,
        review
      FROM testimonials
      ORDER BY testimonial_date DESC;
    `);

    const testimonials = result.recordset;
    res.status(200).json(testimonials);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function postRentOffer(req, res) {
  try {
    const uploadedFiles = req.files;
    const {
      clientName,
      contactOfferEmail,
      contactOfferPhone,
      premisesAddress,
      squareFootage,
      financialOffer,
      offerDetails,
    } = req.body;

    if (
      !clientName ||
      !contactOfferEmail ||
      !contactOfferPhone ||
      !premisesAddress ||
      !squareFootage ||
      !financialOffer ||
      !offerDetails ||
      !uploadedFiles
    ) {
      throw new MissingFiledsError("All offer fields are required", 400);
    }

    // Regex
    if (
      !isValidName(clientName) ||
      !isValidPhone(contactOfferPhone) ||
      !isValidPositiveNumber(financialOffer) ||
      !isValidSquareFootage(squareFootage)
    ) {
      throw new ValidationError("Invalid data format", 400);
    }

    const resizedImages = [];

    for (const file of uploadedFiles) {
      const resizedImageBuffer = await sharp(file.buffer)
        .resize(1280, 720, {
          fit: sharp.fit.inside,
        })
        .jpeg({ quality: 80 })
        .toBuffer();

      const timestamp = Date.now();
      const newFilename = `${timestamp}.jpg`;
      const newFilePath = `./assets/img/${newFilename}`;
      await sharp(resizedImageBuffer).toFile(newFilePath);

      resizedImages.push(newFilename);
    }

    const pool = await createPool();

    // Insert rent_offer
    const result = await pool
      .request()
      .input("cName", sql.NVarChar(), clientName)
      .input("offerEmail", sql.NVarChar(), contactOfferEmail)
      .input("offerPhone", sql.VarChar(), contactOfferPhone)
      .input("offerAddress", sql.NVarChar(), premisesAddress)
      .input("squareFootage", sql.TinyInt(), squareFootage)
      .input("financialOffer", sql.SmallInt(), financialOffer)
      .input("offerDetails", sql.NVarChar(), offerDetails).query(`
        INSERT INTO rent_offers(client_name, contact_email, contact_phone, offer_address, square_footage, financial_offer, offer_details)
        OUTPUT INSERTED.id_rent_offer
        VALUES (@cName, @offerEmail, @offerPhone, @offerAddress, @squareFootage, @financialOffer, @offerDetails)
      `);

    const idRentOffer = result.recordset[0].id_rent_offer;

    // Insert rent_offer_pictures
    await pool
      .request()
      .input("idRentOffer", sql.Int(), idRentOffer)
      .input("pic1", sql.NVarChar(), resizedImages[0])
      .input("pic2", sql.NVarChar(), resizedImages[1]).query(`
        INSERT INTO rent_offer_pictures(id_rent_offer, src)
        VALUES (@idRentOffer, @pic1), (@idRentOffer, @pic2)
      `);

    res.status(201).json({ message: "Rent offer submitted successfully!" });
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else if (err instanceof ValidationError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function postContactMessage(req, res) {
  try {
    const { email, title, content } = req.body;

    if (!email || !title || !content) {
      throw new MissingFiledsError("All fields are required!");
    }

    const pool = await createPool();

    await pool
      .request()
      .input("email", sql.NVarChar(), email)
      .input("title", sql.NVarChar(), title)
      .input("content", sql.NVarChar(), content).query(`
        INSERT INTO messages(message_title, message_content, sender_email)
        VALUES(@title, @content, @email)
      `);

    res.status(201).json({ message: "Successfully sent message!!" });
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else {
      internalServerError(err, res);
    }
  }
}

async function getFaqs(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT faq_question, faq_answer
      FROM FAQs
    `);

    const faqs = result.recordset;
    res.status(200).json(faqs);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getRepairServices(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT service_description, service_price, service_estimated_time
      FROM repair_service
    `);

    const repairServices = result.recordset;
    res.status(200).json(repairServices);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getStoresInfo(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT
        s.store_name,
        s.store_contact_phone,
        s.hourly_rate_working_days,
        s.hourly_rate_saturday,
        l.number,
        l.latitude,
        l.longitude,
        st.street_name,
        c.city_name
      FROM stores s
        INNER JOIN locations l ON s.id_location = l.id_location
        INNER JOIN streets st ON l.id_street = st.id_street
        INNER JOIN cities c ON l.id_city = c.id_city
    `);

    const stores = result.recordset;

    res.status(200).json(stores);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getPaymentTypes(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
      SELECT
        payment_type,
        payment_type_description,
        payment_type_img_src
      FROM payment_types
    `);

    const paymentTypes = result.recordset;

    res.status(200).json(paymentTypes);
  } catch (err) {
    internalServerError(err, res);
  }
}

async function getPopularCategories(req, res) {
  try {
    const pool = await createPool();

    const result = await pool.query(`
        SELECT TOP(3)
          c.id_category,
          c.category_name,
          c.category_description,
          ci.src
        FROM categories c INNER JOIN category_images ci ON c.id_category = ci.id_category
        WHERE c.popular = 1;
      `);

    const popularCategories = result.recordset;

    res.status(200).json(popularCategories);
  } catch (err) {
    internalServerError(err, res);
  }
}

// =============================

function errorHandler(err, res) {
  console.log(`Error: ${err}`);
  res.status(err.status).json({ message: err.message });
}

function internalServerError(err, res) {
  console.log(err);
  res.status(500).json({ message: "Internal server error" });
}

function getCurrentDate() {
  const currDate = new Date();

  const year = currDate.getFullYear();
  const month = String(currDate.getMonth() + 1).padStart(2, "0");
  const day = String(currDate.getDate()).padStart(2, "0");

  const formattedDate = `${year}-${month}-${day}`;

  return formattedDate;
}

module.exports = {
  getFeaturedProducts,
  getTestimonials,
  postRentOffer,
  postContactMessage,
  getFaqs,
  getRepairServices,
  getStoresInfo,
  getPaymentTypes,
  getPopularCategories,
};
