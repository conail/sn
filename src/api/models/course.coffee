 # Represents a Course.  Courses are units of instruction given periodically in 
 # units of classes.
 #
 # Classes are instances of courses, they have datetimes.  Courses do not.

mongoose = require 'mongoose'

Course = mongoose.model 'Course',
  name: String
  summary: String
  created: { type: Date, default: Date.now }
  author: String
  modified: Date

module.exports = Course
