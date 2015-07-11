Course = React.createClass
  render: ->
    <div className="course">
      <header>
        <h1>{@props.name}</h1>
      </header>
      <div className="synopsis">
        <p>{@props.summary}</p>
      </div>
      <div className="videos panel">
        <h2>Videos</h2>
      </div>
      <div className="downloads panel">
        <h2>Downloads</h2>
      </div>
    </div>

module.exports = Course
