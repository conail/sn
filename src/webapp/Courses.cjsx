React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
APIClient    = require './APIClient'
Course       = require './Course'

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
          <Course name={course.name} summary={course.name}/>
        }
      </ul>
    </div>

module.exports = CourseList
