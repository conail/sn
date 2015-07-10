React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
APIClient    = require './APIClient'

module.exports = React.createClass
  componentDidMount: ->
    @api = new APIClient()
    @api.read('/courses/')

  style:
    ul:
      listStyle: 'square' 

  render: ->
    <div id="courses">
      <header>
        <h1>Courses</h1>
      </header>
      <ul style={@style.ul}>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
        <li><Link to="profile">Course</Link></li>
      </ul>
    </div>
