var Profile;

Profile = React.createClass({
  sendMessage: function(e) {
    return alert('My message');
  },
  render: function() {
    return React.createElement("div", {
      "id": "profile"
    }, React.createElement("header", null, React.createElement("h1", null, this.props.name), React.createElement("img", {
      "src": "/img/avatar.png"
    }), React.createElement("ul", {
      "class": "actions"
    }, React.createElement("li", null, React.createElement("button", {
      "onClick": this.sendMessage
    }, "Private Message")))), React.createElement("div", {
      "className": "metadata"
    }, React.createElement("ul", {
      "className": "privacy"
    }, React.createElement("li", null, "Public")), React.createElement("dl", null, React.createElement("dt", null, "Joined"), React.createElement("dd", null, "June 1, 2015"), React.createElement("dt", null, "Last Seen"), React.createElement("dd", null, "June 12, 2015"), React.createElement("dt", null, "Phone"), React.createElement("dd", null))), React.createElement("div", {
      "className": "activity panel"
    }, React.createElement("h2", null, "Recent Activity")), React.createElement("div", {
      "className": "badges panel"
    }, React.createElement("h2", null, "Badges"), React.createElement("p", null, "AP1")), React.createElement("div", {
      "className": "courses panel"
    }, React.createElement("h2", null, "Courses")));
  }
});
