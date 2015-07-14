React = require 'react'

module.exports = React.createClass
  displayName: 'Course'

  edit: ->

  render: ->
    <div className="course" onDoubleClick={@edit}>
      <header>
        <h1>{@props.name}</h1>
      </header>
      <div className="summary">
        <p>{@props.summary}</p>
      </div>
      <div className="videos panel">
        <h2>Videos</h2>
      </div>
      <div className="downloads panel">
        <h2>Downloads</h2>
      </div>
    </div>
