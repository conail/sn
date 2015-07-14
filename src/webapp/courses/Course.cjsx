React = require 'react'

module.exports = React.createClass
  displayName: 'Course'

  edit: -> @props.onEdit()

  render: ->
    <div className="course" onDoubleClick={@edit}>
      <header>
        <h1>{@props.name}</h1>
      </header>
      <div className="summary">
        <p>{@props.summary}</p>
      </div>
    </div>
