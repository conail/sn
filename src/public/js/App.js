var App;

App = React.createClass({
  render: function() {
    var page;
    page = '';
    page = React.createElement(Profile, {
      "name": "John Smith"
    });
    return React.createElement("div", {
      "id": "app"
    }, React.createElement("header", null, React.createElement("nav", {
      "id": "user"
    }, React.createElement("a", {
      "href": "/logout"
    }, "Logout"), React.createElement("a", {
      "href": "/login"
    }, "Login"), React.createElement("a", {
      "href": "/register"
    }, "Register")), React.createElement("nav", {
      "id": "primary"
    }, React.createElement("a", {
      "href": "/"
    }, "Home"), React.createElement("a", {
      "href": "/users"
    }, "Users"))), React.createElement("main", null, page), React.createElement("footer", null, React.createElement("p", {
      "class": "copyright"
    }, "Copyright \u00a9 2015")));
  }
});
