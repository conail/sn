React        = require 'react'
Link         = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
APIClient    = require '../APIClient'
Course       = require './Course'

module.exports = React.createClass
  getInitialState: ->
    courses: []

  componentDidMount: ->
    @api = new APIClient()
    @api.get 'course/', (data) => @setState courses: data

  add: ->
    @state.courses.push { _id: null }
    @setState @state.courses

  edit: ->
    @
    

  render: ->
    <div id="courselist">
      <header>
        <h1>Courses</h1>
        <button onClick={@add}>Add New Course</button>
      </header>
      <article>
        <p>Double-click to edit.</p>
        {@state.courses.map (x) ->  
          <Course key={x._id} name={x.name} summary={x.name}/>
        }
      </article>
    </div>
