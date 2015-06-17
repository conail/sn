var express = require("express");
var router = express.Router();
var passport = require("passport");

// / - Index
router.get('/', function(q, r) {
  r.send(q.toString());
});

// /db - Database connectivity test.
router.get('/db', function (request, response) {
  pg.connect(process.env.DATABASE_URL, function(err, client, done) {
    client.query('SELECT * FROM test_table', function(err, result) {
      done();
      if (err) response.send("Error " + err);
      else response.send(result.rows);
    });
  });
})

// Session Authentication -----------------------------------------------------
router.get("/login", function(q, r) {
  r.render('login', { messages: q.flash() });
});

router.post('/login',passport.authenticate('local', 
  { successRedirect: '/', failureRedirect: '/login', failureFlash: true }));

router.get("/logout", function(q, r) {
  q.logout();
  r.redirect("/");
})

// Export =====================================================================
module.exports = router;
