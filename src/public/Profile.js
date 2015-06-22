var Profile;

Profile = React.createClass({
  render: function() {
    return React.createElement("div", {
      "class": "profile"
    }, React.createElement("header", null, React.createElement("h1", null, "John Smith"), React.createElement("img", {
      "src": "/img/avatar.png"
    }), React.createElement("ul", {
      "class": "actions"
    }, React.createElement("li", null, "Private Message"))), React.createElement("dl", {
      "class": "metadata"
    }, React.createElement("dt", null, "Joined"), React.createElement("dd", null, "June 1, 2015"), React.createElement("dt", null, "Last Seen"), React.createElement("dd", null, "June 12, 2015")), React.createElement("div", {
      "class": "activity panel"
    }, React.createElement("h2", null, "Recent Activity")), React.createElement("div", {
      "class": "badges panel"
    }, React.createElement("h2", null, "Badges")));
  }
});
