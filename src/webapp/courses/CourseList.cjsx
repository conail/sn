React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
APIClient    = require '../APIClient'
Course       = require './Course'

module.exports = React.createClass
  getInitialState: ->
    courses: []

  # Read existing courses from the server.
  componentDidMount: ->
    @api = new APIClient()
    @api.get 'course/', (data) => @setState courses: data

  # Add a course form to edit.
  add: ->
    @state.courses.push { data: {}, editing: on }
    @setState { courses: @state.courses }

  render: ->
    <div id="courselist">
      <header>
        <h1>Courses</h1>
        <button onClick={@add}>Add Course</button>
      </header>
      <article>
        <p>Double-click to edit.</p>
        { for x in @state.courses 
            <Course key={x._id} {...x}/> }
      </article>
    </div>
