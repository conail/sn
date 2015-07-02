express = require 'express'
users    = require './routes/users'
       
app = express()
app.use express.logger('dev')
app.use express.bodyParser()
 
app.get('/users', users.findAll)
app.get('/users/:id', users.findById)
app.post('/users', users.add)
app.put('/users/:id', users.update)
app.delete('/users/:id', users.delete)
 
app.listen 3000
console.log 'Listening on port 3000...'
