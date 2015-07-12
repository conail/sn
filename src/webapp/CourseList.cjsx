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
    @refresh()

  refresh: ->
    @api.get 'course/', (data) =>
      @setState courses: data

  addCourse: ->
    @state.courses.push { _id: null }
    @setState @state.courses

  render: ->
    <div id="courses">
      <header>
        <h1>Courses</h1>
        <button onClick={@addCourse}>Add New Course</button>
      </header>
      <ul style={@style.ul}>
        {@state.courses.map (course) ->  
          <Course id={course._id} name={course.name} summary={course.name}/>
        }
      </ul>
    </div>

module.exports = CourseList
