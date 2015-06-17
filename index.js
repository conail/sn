// index.js

// Module Requirements ========================================================
var express       = require("express");
// TODO: Determine where secret is set.
var session       = require("express-session");
var cookieParser  = require("cookie-parser");
var bodyParser    = require("body-parser");
var flash         = require("connect-flash");
var pg            = require("pg");
var logger        = require("morgan");
var jade          = require("jade");
var passport      = require("passport");
var LocalStrategy = require("passport-local").Strategy;

// Application Configuration ==================================================
var app           = express();
app.set("port", process.env.PORT || 5000);
app.set("views", __dirname + "/views");
app.set("view engine", "jade");

// Middleware Configuration ===================================================
app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser("keyboard cat"));
app.use(session({ cookie: { maxAge: 60000 }}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(express.static(__dirname + '/public'));

// Authentication Strategies.
passport.use(new LocalStrategy(function(username, password, done) {
  User.findOne({ username: username }, function (err, user) {
    if (err) return done(err);
    if (!user) return done(null, false, { message: 'Incorrect username.' });
    if (!user.validPassword(password)) 
      return done(null, false, { message: 'Incorrect password.' });
    return done(null, user);
  });
}));

// Routing ====================================================================
// / - Index
app.get('/', function(q, r) {
  r.send(q.toString());
});

// /db - Database connectivity test.
app.get('/db', function (request, response) {
  pg.connect(process.env.DATABASE_URL, function(err, client, done) {
    client.query('SELECT * FROM test_table', function(err, result) {
      done();
      if (err) response.send("Error " + err);
      else response.send(result.rows);
    });
  });
})

// Session Authentication -----------------------------------------------------
app.get("/login", function(q, r) {
  r.render('login', { messages: q.flash() });
});

app.post('/login',passport.authenticate('local', 
  { successRedirect: '/', failureRedirect: '/login', failureFlash: true }));

// Error Handling =============================================================
app.use(function(e, q, r, next) {
  r.status(e.status || 500);
  var stacktrace = (app.get("env") === "development") ? e : {};
  r.render("error", { message: e.message, error: stacktrace });
});

// Error 404.
app.use(function(q, r, next) {
  var e = new Error("Not found.");
  e.status = 404;
  next(e);
});

// Serve! ---------------------------------------------------------------------
app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});

// Export =====================================================================
module.exports = app;
