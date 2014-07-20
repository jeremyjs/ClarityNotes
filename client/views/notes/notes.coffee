
Template.notes.helpers
  notes: ->
    Notes.find()

Template.note.rendered = ->
  @note = @note || this

Template.note.helpers
  lines: ->
    Lines.find
      noteId: this._id

Template.line.events
  'keyup .note-text': (which) ->
    console.log event.which
    if event.which == 13
      event.preventDefault()
      Lines.insert
        noteId: this.note.id
        text: ''
      return
    console.log
      _id: this._id
    console.log $('#' + this._id).html()
    Lines.upsert
      _id: this._id
    ,
      $set:
        text: $('#line-' + this._id).html()

