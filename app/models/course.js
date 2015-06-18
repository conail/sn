/**
 * /app/models/course.js
 *
 * Represents a Course.  Courses are units of instruction given periodically in 
 * units of classes.
 *
 * Classes are instances of courses, they have datetimes.  Courses do not.
 **/

var Course = function() {
  this.title = "";
  this.summary = "";
}

module.exports = Course;
