express = require 'express'
logger  = require 'morgan'
bodyParser = require 'body-parser'
users   = require './users'
courses = require './courses'
       
app = express()
app.use logger('dev')
app.use bodyParser()
 
# Users
app.get('/users', users.findAll)
app.get('/users/:id', users.findById)
app.post('/users', users.add)
app.put('/users/:id', users.update)
app.delete('/users/:id', users.delete)

# Courses
app.get('/courses', courses.findAll)
app.get('/courses/:id', courses.findById)
app.post('/courses', courses.add)
app.put('/courses/:id', courses.update)
app.delete('/courses/:id', courses.delete)
 
app.listen 3000
console.log 'Listening on port 3000...'
