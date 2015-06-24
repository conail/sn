# index.coffee

# Module Requirements 
express       = require "express"
# TODO: Determine where secret is set.
session       = require "express-session"
cookieParser  = require "cookie-parser"
flash         = require "connect-flash"
pg            = require "pg"
logger        = require "morgan"
passport      = require "passport"
orm           = require "sequelize"

# Application Configuration 
app           = express()
app.set "port", process.env.PORT || 5000
app.set "views", __dirname + "/../views"
app.set 'view engine', 'jade'

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
  r.sendFile '../public/index.html', { root: __dirname }
 
# Error Handling 
app.use (e, q, r, next) ->
  r.status e.status || 500
  stacktrace = (app.get("env") == "development") ? e : {}
  r.render "error", { message: e.message, error: stacktrace }

app.use (q, r, next) ->
  e = new Error("Not found.")
  e.status = 404
  next(e)

app.listen app.get('port'), () -> console.log('Node app is running on port', app.get('port'))

module.exports = app
