React = require 'react'
EditForm = require './CourseEditForm'

# Courses may be displayed in two states:
#
# - Editing
# - Not Editing
#
# When editing, a form is used so that the user may edit and save fields.
# 
# The user may also delete the ntire course.

module.exports = React.createClass
  displayName: 'Course'
  
  getDefaultState: ->
    editing: off
    data:
      name: ''
      summary: ''

  edit:   -> @setState editing: on
  cancel: -> @setState editing: off

  render: ->
    return <EditForm/> if @state.editing 

    <div className="course" onDoubleClick={@edit}>
      <header>
        <h1>{@props.data.name}</h1>
      </header>
      <div className="summary">
        <p>{@props.data.summary}</p>
      </div>
    </div>
