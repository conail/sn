React = require 'react'
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  render: ->
    <div id="courses">
      <header>
        <h1>Courses</h1>
      </header>
      <ul>
        <li><Link to="profile">Course</Link></li>
      </ul>
    </div>
