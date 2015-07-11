mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/sn'

require './user'
require './course'

mongoose.connection.on 'connected', -> console.log('Mongoose connected.')
mongoose.connection.on 'error', (err) -> console.log('Mongoose connection error: ' + err)
mongoose.connection.on 'disconnected', -> console.log('Mongoose disconnected')
process.on 'SIGINT', ->
  mongoose.connection.close ->
    console.log('Mongoose disconnected through app termination')
    process.exit 0
