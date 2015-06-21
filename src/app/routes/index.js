var express = require("express");
var router = express.Router();

// / - Index
router.get('/', function(q, r) {
  r.render("home", { title: "Home" });
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

// Export =====================================================================
module.exports = router;
