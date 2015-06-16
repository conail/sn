var express       = require("express");
var flash         = require("connect-flash");
var cookieParser  = require("cookie-parser");
var session       = require("express-session");
var app           = express();
var pg            = require("pg");
var passport      = require("passport");
var jade          = require("jade");
var LocalStrategy = require("passport-local").Strategy;

// Configure Passport Local Strategy.
passport.use(new LocalStrategy(function(username, password, done) {
  User.findOne({ username: username }, function (err, user) {
    if (err) return done(err);
    if (!user) return done(null, false, { message: 'Incorrect username.' });
    if (!user.validPassword(password)) return done(null, false, { message: 'Incorrect password.' });
    return done(null, user);
  });
}));

// Set the serving port, defaulting to 5000.
app.set('port', (process.env.PORT || 5000));

app.use(express.static(__dirname + '/public'));
app.use(cookieParser("keyboard cat"));
app.use(session({ cookie: { maxAge: 60000 }}));
app.use(flash());

// Pages ----------------------------------------------------------------------
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
  console.log(q.flash());
  var fn = jade.compileFile('views/login.jade');
  r.send(fn());
});

app.post('/login',passport.authenticate('local', 
  { successRedirect: '/', failureRedirect: '/login', failureFlash: true }));

// Serve! ---------------------------------------------------------------------
app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
