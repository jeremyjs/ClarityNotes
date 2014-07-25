Template.google.render ->
  startRealtime()

Template.google.events =
  'keyup #editor1-html': ->
    this.html($('#editor1').value)
