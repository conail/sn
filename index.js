var express = require("express");
var app = express();
var pg = require("pg");
var passport = require("passport");
var jade = require("jade");

// Set the serving port, defaulting to 5000.
app.set('port', (process.env.PORT || 5000));

// Serve static assets from the /public dir.
app.use(express.static(__dirname + '/public'));

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
  var fn = jade.compileFile('views/login.jade');
  r.send(fn());
});

app.post('/login', passport.authenticate('local'), function(q, r) {
  res.redirect('/users/' + q.user.username);
});

// Serve! ---------------------------------------------------------------------
app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
