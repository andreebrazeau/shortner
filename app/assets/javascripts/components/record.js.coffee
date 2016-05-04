@Record = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/url_mapping/#{ @props.record.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record

  render: ->
    React.DOM.tr null,
      React.DOM.td null, 
        React.DOM.a
          href: @props.record.long_url
          @props.record.long_url
      React.DOM.td null, 
        React.DOM.a
          href: window.location.href + @props.record.url_hash
          window.location.href + @props.record.url_hash
      React.DOM.td null,
        React.DOM.a
          onClick: @handleDelete
          className: 'btn btn-danger'
          'Delete'