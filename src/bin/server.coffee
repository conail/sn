express       = require "express"
session       = require "express-session"
cookieParser  = require "cookie-parser"
flash         = require "connect-flash"
logger        = require "morgan"
bodyParser = require 'body-parser'
router   = express.Router()
passport = require "passport"
LocalStrategy = require("passport-local").Strategy

# Application Configuration 
app           = express()
app.set "port", process.env.PORT || 5000

# Middleware Configuration 
app.use logger("dev")
app.use cookieParser("keyboard cat")
app.use session({ cookie: { maxAge: 60000 }})
app.use flash()
app.use passport.initialize()
app.use passport.session()
app.use express.static("#{__dirname}/../public") 

# Routing
app.get '/', (q, r) -> 
  r.sendFile "/layout.html", { root: "#{__dirname}/../public/"  }
 
# Authentication Strategies.
passport.use new LocalStrategy((username, password, done) ->
    if username != "conail" then return done(null, false, { message: 'Incorrect username.' })
    if password != "pw" then return done(null, false, { message: 'Incorrect password.' })
    done null, {name: 'sdf'}
  )

# Session Authentication Routes 
# Login 
app.get '/login', (q, r) -> r.render('login', { messages: q.flash() })
app.post('/login',
  bodyParser.urlencoded({ extended: false }),
  passport.authenticate('local', { successRedirect: '/', failureRedirect: '/login', failureFlash: true }))

# Logout 
app.get '/logout', (q, r) ->
  q.logout()
  r.redirect('/')

# Register 
app.get '/register', (q, r) -> r.render('register')
app.post('/register', (q, r) ->
  Account.register(
    new Account({ username : q.body.username }), q.body.password, (e, account) ->
      if e then return r.render('register', { account : account })
      passport.authenticate('local')(q, r, () -> r.redirect('/') )
  )
)

# Error Handling 
app.use (e, q, r, next) ->
  r.status e.status || 500
  stacktrace = (app.get("env") == "development") ? e : {}
  r.render "error", { message: e.message, error: stacktrace }

app.use (q, r, next) ->
  e = new Error("Not found.")
  e.status = 404
  next(e)

app.listen app.get('port'), () -> console.log("SN running on port #{app.get('port')}")

module.exports = app
