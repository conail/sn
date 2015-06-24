express = require "express"
router = express.Router()

router.get '/', (q, r) -> r.render 'home', { title: 'Home' }

router.get '/db', (q, r) ->
  pg.connect process.env.DATABASE_URL, (err, client, done) ->
    client.query 'SELECT * FROM test_table', (err, result) ->
      done()
      if (err) then response.send "Error #{err}"
      else r.send result.rows

module.exports = router
