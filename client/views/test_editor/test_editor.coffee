@selection = ''
textDep = new Deps.Dependency

Template.testEditor.editorHTML = ->
  textDep.depend()
  $('#editor-html').html($('#editor').val())
  return

Template.testEditor.rendered = ->
  setTimeout ->
    textDep.changed()
  , 300

Template.testEditor.events =
  'keyup #editor': ->
    textDep.changed()

  'click .action': ->
    textDep.changed()

  'keyup #editor-html': ->
    console.log $('#editor-html')[0].innerHTML
    $('#editor').val($('#editor-html')[0].innerHTML)

  'selectstart #editor-html': ->
    $(document).on 'mouseup', ->
      selection = this.getSelection()
      console.log selection
      selection = selection.focusNode.data
      console.log selection

  'click .action-bold': (e, p) ->
    $("#editor").surroundSelectedText("<b>", "</b>")
    console.log selection
    console.log $("#editor-html").html()

  'click .action-italic': ->
    $("#editor").surroundSelectedText("<i>", "</i>")

  'click .action-underline': ->
    $("#editor").surroundSelectedText("<span class=\"underline\">", "</span>")

  'click .action-strikethrough': ->
    $("#editor").surroundSelectedText("<span class=\"strikethrough\">", "</span>")

  'click .action-subscript': ->
    $("#editor").surroundSelectedText("<sub>", "</sub>")

  'click .action-superscript': ->
    $("#editor").surroundSelectedText("<sup>", "</sup>")

  'click .action-highlight': ->
    $("#editor").surroundSelectedText("<span class=\"highlight\">", "</span>")

  'click .action-link': ->
    $("#editor").surroundSelectedText("<a href=\"#\">", "</a>")

  'click .action-justify': ->
    $("#editor").surroundSelectedText("<span class=\"justify-right\">", "</span>")

  'click .action-spacing': ->
    $("#editor").surroundSelectedText("<span class=\"spacing-double\">", "</span>")

  'click .action-ul': ->
    $("#editor").surroundSelectedText("<span class=\"ul\">", "</span>")

  'click .action-ol': ->
    $("#editor").surroundSelectedText("<span class=\"ol\">", "</span>")

  'click .action-remove': ->
    $("#editor").surroundSelectedText("<span class=\"remove\">", "</span>")

  'click .action-case': ->
    $("#editor").surroundSelectedText("<span class=\"case\">", "</span>")

  'click .action-quote': ->
    $("#editor").surroundSelectedText("<span class=\"quote\">", "</span>")

