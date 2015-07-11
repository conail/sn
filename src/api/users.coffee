express = require 'express'
mongo = require 'mongodb'
db = require './models/db'
user = require './models/user'
course = require './models/course'

app = new Express()

# User Routes
app.get '/user', user.index
app.get '/user/new', user.create
app.post '/user/new', user.doCreate
app.get '/user/edit', user.edit
app.post '/user/edit', user.doEdit
app.get '/user/delete', user.confirmDelete
app.post '/user/delete', user.doDelete

app.get '/login', user.login
app.post '/login', user.doLogin
app.get '/logout', user.doLogout

# Course Routes
app.get '/course', course.index
app.get '/course/new', course.create
app.post '/course/new', course.doCreate
app.get '/course/:id', course.displayInfo
app.get '/course/:id/edit', course.edit
app.post '/course/:id/edit', course.doEdit
app.get '/course/:id/delete', course.confirmDelete
app.post '/course/:id/delete', course.doDelete
