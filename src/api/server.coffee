express = require 'express'
logger  = require 'morgan'
cors    = require 'cors'
bodyParser = require 'body-parser'
mongo   = require 'mongodb'
db      = require './models/db'
User    = require './models/user'
Course  = require './models/course'
       
app = express()
app.use cors()
app.use logger 'dev'
app.use bodyParser()
 
# User Routes
app.get '/user',             (q,r) ->
  r.send User.find()

app.get '/user/:id',         (q,r) ->
  r.send User.findById(q.id)

app.post '/user/create',     (q,r) ->
  User.create(q.user)
  r.send 200

app.post '/user/:id/edit' ,  (q,r) ->
  User.findById(q.id).update(q.user)
  r.send 200

app.post '/user/:id/delete', (q,r) ->
  User.findById(q.id).delete()
  r.send 200

# Course Routes
app.get '/course', (q,r) ->
  Course.find (err, courses) ->
    throw err if err
    r.send courses

app.post '/course', (q,r) ->
  console.log q.body
  Course.create(q.user)
  r.status(200).end()

app.get '/course/:id', (q,r) ->
  Course.findById q.id, (err, course) ->
    r.send course

app.post '/course/:id', (q,r) ->
  Course.findById q.id, (err, course) ->
    course.update(q.user)
  r.send 200

app.delete '/course/:id', (q,r) ->
  Course.findById q.params.id, (err, course) =>
    r.send course.remove()

# Bind server to port.
app.listen 3333
console.log 'API listening on port 3333.'

module.exports = app
