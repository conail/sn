APIClient = require './APIClient'

Course = React.createClass
  getInitialState: ->
    editing: false
    name: @props.name
    summary: @props.summary

  componentDidMount: ->
    @api = new APIClient()

  edit: ->
    @setState editing: true

  cancel: ->
    @setState @getInitialState()

  save: ->
    uri = if @props.id then "course/#{@props.id}/edit" else 'course/new'
    @api.post uri, { name: @state.name, summary: @state.summary }, (data) =>
      @setState editing: false

  delete: ->
    unless @props.id then return @cancel()
    uri = "course/#{@props.id}/delete" 
    @api.post uri, {}, (data) =>
      @setState editing: false

  render: ->
    if @state.editing
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
    else
      <div className="course" onDoubleClick={@edit}>
        <header>
          <h1>{@state.name}</h1>
        </header>
        <div className="summary">
          <p>{@state.summary}</p>
        </div>
        <div className="videos panel">
          <h2>Videos</h2>
        </div>
        <div className="downloads panel">
          <h2>Downloads</h2>
        </div>
        <div>
        </div>
      </div>

module.exports = Course
