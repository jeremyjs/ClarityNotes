isLoggedIn = (action) ->
  unless Meteor.loggingIn() || Meteor.user()
    this.render 'login'
    action()

# Router.onBeforeAction isLoggedIn,
#   except: ['login', 'signup', 'testEditor']

Router.map ->
  @route 'root',
    path: '/'
    action: ->
      this.redirect 'testEditor'

  @route 'login',
    yieldTemplates:
      header:
        to: false
      navbar:
        to: false
      sidebar:
        to: false

  @route 'signup'

  @route 'dashboard'

  @route 'notes'

  @route 'newNote',
    path: 'notes/new'
    template: 'note'
    data: ->
      id = Notes.insert
        title: 'new note'
      line = Lines.insert
        noteId: id
        text: ''
        empty: true
        note: Notes.findOne(this.noteId)
      Notes.findOne(id)

  @route 'note',
    path: 'notes/:id'
    template: 'note'
    data: ->
      Notes.findOne(this.params.id)

  @route 'notifications'

  @route 'accountSettings',
    path: '/settings/account'

  @route 'applicationSettings',
    path: '/settings/application'

  @route 'currentProfile',
    template: 'profile'
    path: '/profile'
    data: ->
      user = Meteor.user()
      # person = Meteor.users.find id

  @route 'profile',
    template: 'profile'
    path: '/profile/:id'
    data: ->
      id = this.params.id
      user = Meteor.users.find {id: id}
      # person = Meteor.users.find id

  @route 'testEditor',
    path: '/test/editor'

