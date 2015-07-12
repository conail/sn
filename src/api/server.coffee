express = require 'express'
logger  = require 'morgan'
cors    = require 'cors'
bodyParser = require 'body-parser'
mongo   = require 'mongodb'
db      = require './models/db'
User    = require './models/user'
Course  = require './models/course'
       
app = express()
#app.use cors
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
  r.setHeader 'Access-Control-Allow-Origin', '*'
  Course.find {}, (err, courses) ->
    if err then throw err
    r.send courses

app.post '/course/new', (q,r) ->
  r.setHeader 'Access-Control-Allow-Origin', '*'
  Course.create(q.user)
  r.send 200

app.get '/course/:id', (q,r) ->
  r.setHeader 'Access-Control-Allow-Origin', '*'
  Course.findById q.id, (err, course) ->
    r.send course

app.post '/course/:id/edit', (q,r) ->
  r.setHeader 'Access-Control-Allow-Origin', '*'
  Course.findById q.id, (err, course) ->
    course.update(q.user)
  r.send 200

app.post '/course/:id/delete', (q,r) ->
  r.header 'Access-Control-Allow-Origin', '*'
  Course.findById q.params.id, (err, course) =>
    r.send course.remove()

# Bind server to port.
app.listen 3333
console.log 'API listening on port 3333.'

module.exports = app
