express  = require "express"
router   = express.Router()
passport = require "passport"
LocalStrategy = require("passport-local").Strategy

# Authentication Strategies.
passport.use new LocalStrategy( (username, password, done) ->
    if (username != "conail") return done(null, false, { message: 'Incorrect username.' })
    if (password != "pw") return done(null, false, { message: 'Incorrect password.' })
    done null, {}
  )

# Session Authentication Routes ==============================================
# Login 
router.get("/login", (q, r) -> r.render('login', { messages: q.flash() })
router.post("/login", passport.authenticate("local", { successRedirect: '/', failureRedirect: "/login", failureFlash: true } ))

# Logout 
router.get("/logout", (q, r) ->
  q.logout()
  r.redirect("/")

# Register 
router.get("/register", (q, r) -> r.render("register")
router.post('/register', (q, r) ->
  Account.register(
    new Account({ username : q.body.username }), q.body.password, (e, account) ->
      if (e) return r.render("register", { account : account })
      passport.authenticate("local")(q, r, () -> r.redirect('/') )
  )
)

module.exports = router
