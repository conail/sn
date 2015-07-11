mongo = require 'mongodb'

Server = mongo.Server
Db     = mongo.Db
BSON   = mongo.BSONPure

server = new Server 'localhost', 27017, {auto_reconnect: true}
db     = new Db 'test', server

db.open (err, db) ->
  unless err then db.collection 'users', { strict: true }, (err, collection) ->
    if err 
      console.log("The 'users' collection doesn't exist. Creating it with sample data...")

exports.findById = (req, res) ->
  id = req.params.id
  db.collection 'users', (err, collection) ->
    collection.findOne {'_id': new BSON.ObjectID(id)}, (err, item) ->
      res.send item

exports.findAll = (req, res) ->
  db.collection 'users', (err, collection) ->
    collection.find().toArray (err, items) ->
      res.send items

exports.add = (req, res) ->
  users = req.body
  db.collection 'users', (err, collection) ->
    collection.insert users, {safe:true}, (err, result) ->
      res.send if err
        { error: 'An error has occurred'}
      else
       result[0]

exports.update = (q, r) ->
  id = req.params.id
  user = req.body
  db.collection 'users', (err, collection) ->
    collection.update {'_id':new BSON.ObjectID(id)}, user, {safe:true}, (err, result) ->
      if err then r.send {'error':'An error has occurred'}
      else r.send users

exports.delete = (q, r) ->
  id = req.params.id
  db.collection 'users', (err, collection) ->
    collection.remove {'_id':new BSON.ObjectID(id)}, { safe: true }, (err, result) ->
      r.send if err
        { error: "An error has occurred - #{err}" }
      else
        q.body
