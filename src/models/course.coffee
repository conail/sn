 # Represents a Course.  Courses are units of instruction given periodically in 
 # units of classes.
 #
 # Classes are instances of courses, they have datetimes.  Courses do not.

orm = require 'mongoose'
orm.connect process.env.DATABASE_URL or 'mongodb://localhost/sn'

Course = mongoose.model 'Cat',
  name: String
  summary: String

module.exports = Course
