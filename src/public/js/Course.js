var Course;

Course = React.createClass({
  render: function() {
    return React.createElement("div", {
      "class": "course"
    }, React.createElement("header", null, React.createElement("h1", null, "AP1")), React.createElement("div", {
      "class": "synopsis"
    }), React.createElement("div", {
      "class": "videos panel"
    }, React.createElement("h2", null, "Videos")), React.createElement("div", {
      "class": "downloads panel"
    }, React.createElement("h2", null, "Downloads")));
  }
});
