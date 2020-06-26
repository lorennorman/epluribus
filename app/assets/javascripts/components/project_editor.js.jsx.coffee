div = React.createFactory 'div'
img = React.createFactory 'img'
@ProjectEditor = React.createClass
  handleRemove: (e) ->
    $(@refs["row"]).fadeOut( => @.props.onRemoveItem() )

  render: ->
    div className: "row editors-edit-row fade in", ref: "row",
      div className: "col-md-3",
        img src: this.props.editor.avatar, className:"activitar"
      div className:"col-md-9",
        "#{@props.editor.name} <#{@props.editor.email}>"
      div className:"remove", onClick:@.handleRemove,
        "×"
