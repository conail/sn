mongoose = require 'mongoose'

User = mongoose.model 'User',
  username:  { type: String, unique: true }
  password: String
  email:  { type: String, unique: true }
  password: String
  created: { type: Date, 'default': Date.now }
  modified: Date
  accessed: Date

module.exports = User
