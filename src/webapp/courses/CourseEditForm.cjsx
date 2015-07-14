React     = require 'react'
APIClient = require '../APIClient'

module.exports = React.createClass
  getInitialState: ->
    name:    @props.name
    summary: @props.summary

  componentDidMount: ->
    @api = new APIClient()
    @uri = "course/#{@props.id}"

  edit: ->
    @setState editing: true

  cancel: ->
    @setState @getInitialState()

  save: ->
    courseDTO = 
      name:    @state.name
      summary: @state.summary
    @api.post @uri, courseDTO, (data) =>
      @setState editing: false

  delete: ->
    unless @props.id then return @cancel()
    @api.delete @uri, => @._owner.refresh()

  render: ->
    <form className="course edit">
      <fieldset>
        <label>
          <span>Course Name</span>
          <input type="text" defaultValue={@state.name}/>
        </label>
        <label>
          <span>Summary</span>
          <textarea defaultValue={@state.summary}/>
        </label>
      </fieldset>
      <fieldset className="controls">
        <button className="delete" onClick={@delete}>Delete</button>
        <button onClick={@cancel}>Cancel</button>
        <button className="save" onClick={@save}>Save</button>
      </fieldset>
    </form>

