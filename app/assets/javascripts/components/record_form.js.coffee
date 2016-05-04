@RecordForm = React.createClass
  getInitialState: ->
    long_url: ''
  
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  
  valid: ->
    @state.long_url
  
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/url_mapping', { url_mapping: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'url'
          className: 'form-control'
          placeholder: 'Url'
          name: 'long_url'
          value: @state.url
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create short url'