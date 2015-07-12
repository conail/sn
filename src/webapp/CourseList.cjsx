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
    @api.get 'course/', (data) =>
      @setState courses: data

  render: ->
    <div id="courses">
      <header>
        <h1>Courses</h1>
      </header>
      <ul style={@style.ul}>
        {@state.courses.map (course) ->  
          <Course id={course._id} name={course.name} summary={course.name}/>
        }
      </ul>
    </div>

module.exports = CourseList
