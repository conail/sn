React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  render: ->
    listStyle = 
      listStyle: 'square' 

    <div id="courses">
      <header>
        <h1>Courses</h1>
      </header>
      <ul style={listStyle}>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
      </ul>
    </div>
