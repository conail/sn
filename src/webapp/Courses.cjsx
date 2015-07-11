React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
APIClient    = require './APIClient'

CourseList = React.createClass
  style:
    ul:
      listStyle: 'square' 

  getInitialState: ->
    courses: []

  componentDidMount: ->
    @api = new APIClient()
    @api.read 'course/', (data) =>
      @setState courses: data

  render: ->
    <div id="courses">
      <header>
        <h1>Courses</h1>
      </header>
      <ul style={@style.ul}>
        {@state.courses.map (course) ->  
          <li>
            <Link to="profile">{course.name}</Link>
          </li>
        }
      </ul>
    </div>

module.exports = CourseList
