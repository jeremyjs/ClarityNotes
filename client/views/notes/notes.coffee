textSelect = (inp, s, e) ->
  e = e || s
  if (inp.createTextRange)
    r = inp.createTextRange()
    r.collapse(true)
    r.moveEnd('character', e)
    r.moveStart('character', s)
    r.select()
  else if(inp.setSelectionRange)
    inp.focus()
    inp.setSelectionRange(s, e)

sleep = (ms, callback) ->
  setTimeout ->
    callback()
  , ms

Template.notes.helpers
  notes: ->
    Notes.find()

Template.notes.events
  'click .new-note': ->
    id = Notes.insert
      title: 'new note'
    lineId = Lines.insert
      noteId: id
      text: ''
      empty: true
    Router.go '/notes/' + id

Template.note.helpers
  lines: ->
    Lines.find
      noteId: this._id

Template.note.events
  'keyup .note-title': (event, elem) ->
    title = elem.find('h2')
    $title = $('.note-title')
    text = $title.html()
    title.innerHTML = text

    Notes.update
      _id: this._id
    ,
      title: text

Template.line.events
  'keypress .line': (event) ->
    if event.which == 13
      event.preventDefault()

  'keyup .line': (event, p) ->
    if event.which == 13
      noteId = $('.note').attr('id').substring(5)
      console.log noteId
      id = Lines.insert
        noteId: noteId
        text: ''
        empty: true
      console.log id
      sleep 1000, ->
        console.log newLine = document.getElementById('line-' + id)
        textSelect(newLine, 0)
      return

    line = p.find('p')
    $line = $('#line-' + this._id)
    lineHTML = $line.html()
    line.innerHTML = lineHTML

    if event.which == 8 && this.empty
      console.log 'delete'
      Lines.remove
        _id: this._id

    empty = if (lineHTML == '') then true else false
    console.log empty

    Lines.update
      _id: this._id
    ,
      $set:
        text: lineHTML
        empty: empty

