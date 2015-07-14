React     = require 'react'

module.exports = React.createClass
  getInitialState: ->
    name:    @props.name
    summary: @props.summary

  cancel: -> @props.onCancel() 
  save:   -> @props.onSave()
  delete: -> @props.onDelete()

  render: ->
    <form className="course edit">
      <fieldset>
        <label>
          <span>Course Name</span>
          <input type="text" defaultValue={@props.name}/>
        </label>
        <label>
          <span>Summary</span>
          <textarea defaultValue={@props.summary}/>
        </label>
      </fieldset>
      <fieldset className="controls">
        <button className="delete" onClick={@delete}>Delete</button>
        <button onClick={@cancel}>Cancel</button>
        <button className="save" onClick={@save}>Save</button>
      </fieldset>
    </form>
