accountError = (params) ->
  if params && params['error']
    console.log params['reason']
    Session.set 'userError', params['reason']
  else
    console.log "success"
    Router.go pathFor 'newNote'

createOrLogin = (action = "login") ->
  event.preventDefault()
  email = $('#login-email').val()
  password = $('#login-password').val()

  if action == "login"
    console.log "validating user '#{email}' with password '#{password}'..."
    # Session.setDefault('name', email.slice(email.indexof('@')))
    Meteor.loginWithPassword email, password, accountError
  else if action == "create"
    console.log "creating user '#{email}' with password '#{password}'..."
    Accounts.createUser { email: email, password: password }, accountError

  else
    console.log "createOrLogin: invalid action parameter"

Template.login.helpers
  errors: ->
    Session.get 'userError'

Template.login.events
  'click #login-button': ->
    createOrLogin "login"

  'click #signup-button': ->
    createOrLogin "create"

  'submit form': ->
    createOrLogin "login"

