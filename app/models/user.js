// app/models/user.js

// Module Requirements ========================================================
var Sequelize = require("sequelize");
var ORM = new Sequelize(process.env.DATABASE_URL);

// Constructor ================================================================
var User = ORM.model("User", {
  username: Sequelize.STRING,
  password: Sequelize.STRING,
  email:    Sequelize.STRING
});

// Exports ====================================================================
module.exports = User;
