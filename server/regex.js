const nameRegex =
  /^[A-ZČĆŽĐŠ][a-zA-ZČĆŽĐŠčćžđš]*('[a-zA-ZČĆŽĐŠčćžđš]*)?(\s[a-zA-ZČĆŽĐŠčćžđš]*)?$/;
const phoneRegex = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/;
const passwordRegex =
  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,}$/;
const positiveNumberRegex = /^\d{2,}$/;
const squareFootageRegex = /^(7[0-9]|1\d{2}|200)$/;

module.exports = {
  nameRegex,
  phoneRegex,
  passwordRegex,
  positiveNumberRegex,
  squareFootageRegex,
};
