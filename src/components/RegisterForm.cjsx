RegisterForm = React.createComponent
  render: ->
    errorMsg = if @props.error then @props.error else ''

    <form name="register" action="/register" method="post">
      <div className="alert error">
        {errorMsg}
      </div>
      <fieldset>
        <label>
          <span>Username</span>
          <input type="text" name="username"/>
        </label>
        <label>
          <span>Password</span>
          <input type="password" name="password"/>
        </label>
      </fieldset>
      <fieldset className="controls">
        <input type="submit" value="Login"/>
      </fieldset>
    </form>
      
