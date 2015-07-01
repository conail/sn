express  = require 'express'
router   = express.Router()

router.get '/profile', (q, r) ->
  r.render('profile')

module.exports = router
