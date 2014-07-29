accountError = (params) ->
  if params && params['error']
    console.log params['reason']
    Session.set 'userError', params['reason']
  else
    console.log "success"
    Router.go pathFor 'newNote'

@loginUser = (email, password) ->
  console.log "validating user '#{email}' with password '#{password}'..."
  Meteor.loginWithPassword email, password, accountError
@createUser = (email, password) ->
  console.log "creating user '#{email}' with password '#{password}'..."
  Accounts.createUser { email: email, password: password }, accountError

createOrLogin = (action = "login") ->
  event.preventDefault()
  email = $('#login-email').val()
  password = $('#login-password').val()

  if action == "login"
    loginUser(email, password)
  else
    createUser(email, password)

Template.login.helpers
  errors: ->
    Session.get 'userError'

Template.login.events
  'click #login-button': ->
    createOrLogin "login"
    
  'click #login-button-google': ->
    createOrLogin "create" 

  'click #signup-button': ->
    createOrLogin "create"

  'submit form': ->
    createOrLogin "login"

