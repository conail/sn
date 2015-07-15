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
    @loadAll()

  loadAll: ->
    @api.get 'course/', (data) => @setState courses: data

  add: ->
    @state.courses.push {}
    @setState { courses: @state.courses }

  edit: (e) -> 
    console.log e
    #@setState @state.courses[e.target.key].editing: on

  cancel: (e) -> 
    #@setState @state.courses[e.target.key].editing: off

  delete: (e) ->
    @api.delete 'course/' + e.target.key
    @loadAll()

  render: ->
    <div id="courselist">
      <header>
        <h1>Courses</h1>
        <button onClick={@add}>Add New Course</button>
      </header>
      <article>
        <p>Double-click to edit.</p>
        {@state.courses.map (x) ->  
            if x.editing
              <CourseEditForm key={x._id} {...x} onDelete={@delete} onSave={@save} onCancel={@cancel}/>
            else
              <Course key={x._id} {...x} onEdit={@edit}/>
        }
      </article>
    </div>
