require("dotenv").config();
const sql = require("mssql/msnodesqlv8");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const createPool = require("../db");
const { nameRegex, phoneRegex, passwordRegex } = require("../regex");
const {
  ValidationError,
  MissingFiledsError,
  ValueExistsInDatabaseError,
} = require("../error");

// REGEX FUNCTIONS
function isValidName(name) {
  return nameRegex.test(name);
}
function isValidPhone(phone) {
  return phoneRegex.test(phone);
}
function isValidPassword(password) {
  return passwordRegex.test(password);
}
function isValidRetypePassword(password, retype) {
  if (password === retype) return true;
  return false;
}

// ASYNC FUNCTIONS
async function registerUser(req, res) {
  try {
    const {
      firstName,
      lastName,
      phone,
      email,
      password,
      retypePassword,
      newsletter,
    } = req.body;

    // We don't check newsletter cause its value can be null and therefore it will return status 400!!
    if (
      !firstName ||
      !lastName ||
      !phone ||
      !email ||
      !password ||
      !retypePassword
    ) {
      throw new MissingFiledsError("All registration fields are required", 400);
    }

    // Regex
    if (
      !isValidName(firstName) ||
      !isValidName(lastName) ||
      !isValidPhone(phone) ||
      !isValidPassword(password) ||
      !isValidRetypePassword(password, retypePassword)
    ) {
      throw new ValidationError("Invalid data format", 400);
    }

    const pool = await createPool();

    // Check if the email already exists in the database
    const emailCheckResult = await pool
      .request()
      .input("email", sql.NVarChar(), email).query(`
      SELECT COUNT(*) AS emailCount FROM users WHERE user_email = @email
    `);

    if (emailCheckResult.recordset[0].emailCount > 0) {
      throw new ValueExistsInDatabaseError("Email already exists!", 409);
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user
    const result = await pool
      .request()
      .input("fName", sql.NVarChar(), firstName)
      .input("lName", sql.NVarChar(), lastName)
      .input("phone", sql.VarChar(), phone)
      .input("email", sql.NVarChar(), email)
      .input("pass", sql.NVarChar(), hashedPassword).query(`
        INSERT INTO users(first_name, last_name, user_phone, user_email, user_password)
        OUTPUT INSERTED.*
        VALUES (@fName, @lName, @phone, @email, @pass)
      `);
    if (newsletter) {
      await pool
        .request()
        .input("email", sql.NVarChar(), email)
        .query(
          `INSERT INTO newsletter_subscribers (subscriber_email)
            VALUES (@email)
        `
        );
    }
    const user = result.recordset[0];

    res.status(201).json({
      message: "User registered successfully",
      user: {
        firstName: user.first_name,
        lastName: user.last_name,
        email: user.user_email,
      },
    });
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else if (err instanceof ValidationError) {
      errorHandler(err, res);
    } else if (err instanceof ValueExistsInDatabaseError) {
      errorHandler(err, res);
    } else {
      console.log(err);
      res.status(500).json({ message: "Internal server error" });
    }
  }
}

async function loginUser(req, res) {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      throw new MissingFiledsError("All login fields are required", 400);
    }

    // Regex
    if (!isValidPassword(password)) {
      throw new ValidationError("Invalid data format", 400);
    }

    const pool = await createPool();

    // Check if the user exists in the database
    const userResult = await pool
      .request()
      .input("email", sql.NVarChar(), email).query(`
        SELECT * FROM users WHERE user_email = @email;
      `);

    const user = userResult.recordset[0];

    if (!user) {
      throw new ValueExistsInDatabaseError("Invalid email or password", 401);
    }

    // Compare the provided password with the hashed password from the DB
    const isPasswordValid = await bcrypt.compare(password, user.user_password);

    if (!isPasswordValid) {
      throw new ValueExistsInDatabaseError("Invalid email or password", 401);
    }

    // Insert login data in logins table
    const insertLogin = await pool
      .request()
      .input("id", sql.Int(), user.id_user).query(`
        INSERT INTO logins(id_user)
        VALUES(@id);
      `);

    // Craete a JSON Web Token (JWT) with the user's ID as the payload
    const jwtPayload = {
      idUser: user.id_user,
      firstName: user.first_name,
      lastName: user.last_name,
      email: user.user_email,
      phone: user.user_phone,
      registerDate: user.register_date,
      idRole: user.id_role,
    };
    const secretKey = process.env.JWT_SECRET;
    const token = jwt.sign(jwtPayload, secretKey, {
      expiresIn: "30d",
    });

    // Return the token adn the user data as the response
    res.status(200).json({ message: "User logged successfully", token });
  } catch (err) {
    if (err instanceof MissingFiledsError) {
      errorHandler(err, res);
    } else if (err instanceof ValidationError) {
      errorHandler(err, res);
    } else if (err instanceof ValueExistsInDatabaseError) {
      errorHandler(err, res);
    } else {
      console.log(err);
      res.status(500).json({ message: "Internal server error" });
    }
  }
}

function errorHandler(err, res) {
  console.log(`Error: ${err}`);
  res.status(err.status).json({ message: err.message });
}

module.exports = {
  registerUser,
  loginUser,
};
