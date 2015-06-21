// Module Requirements ========================================================
var express = require("express");
var router = express.Router();
var passport = require("passport");
var LocalStrategy = require("passport-local").Strategy;

// Authentication Strategies.
passport.use(new LocalStrategy(
  function(username, password, done) {
    if (username !== "conail") 
      return done(null, false, { message: 'Incorrect username.' });
    else if (password !== "pw") 
        return done(null, false, { message: 'Incorrect password.' });
    else return done(null, {});
  })
);

// Session Authentication Routes ==============================================
// Login ----------------------------------------------------------------------
router.get("/login", function(q, r) {
  r.render('login', { messages: q.flash() });
});

router.post("/login", passport.authenticate("local", 
  { successRedirect: '/', failureRedirect: "/login", failureFlash: true }
));

// Logout ---------------------------------------------------------------------
router.get("/logout", function(q, r) {
  q.logout();
  r.redirect("/");
});

// Register -------------------------------------------------------------------
router.get("/register", function(q, r){
  r.render("register");
});

router.post('/register', function(q, r){
  Account.register(
    new Account({ username : q.body.username }), 
    q.body.password, 
    function(e, account) {
      if (e) return r.render("register", { account : account });
      passport.authenticate("local")(q, r, function (){ r.redirect('/'); });
    }
  );
});

// Export =====================================================================
module.exports = router;
