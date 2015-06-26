 # Represents a Course.  Courses are units of instruction given periodically in 
 # units of classes.
 #
 # Classes are instances of courses, they have datetimes.  Courses do not.

orm = require 'sequelize'

Course = sequelize.define('course', {
    title: { type: Sequelize.STRING },
    summary: { type: Seq0uelize.STRING }
  }

Course.sync({force: true}).then(() -> User.create({ title: 'Test', summary: 'test.' }) 

module.exports = Course;
