accountError = (params) ->
  if params && params['error']
    console.log params['reason']
    Session.set 'userError', params['reason']
    true
  else
    console.log "success"
    false

passwordError = (params) ->
  unless accountError(params)
    updateEmail()

emailError = (params) ->
  accountError(params)
    # Router.render '/feed'

updatePassword = ->
  current_password = $('#current-password').val()
  new_password = $('#new-password').val()
  console.log "validating user '#{@userEmail()}' with password '#{current_password}'..."
  console.log "changing info to user '#{email}' with password '#{new_password}'..."
  Accounts.changePassword current_password, new_password, passwordError

updateEmail = ->
  email = $('#email').val()
  Meteor.users.update _id: Meteor.userId(),
    $set:
      emails: [
        address: email
      ]
    , emailError

updateUser = ->
  event.preventDefault()
  updatePassword()

Template.accountSettings.helpers
  errors: ->
    Session.get 'userError'

Template.accountSettings.events =
  'click #save-button': ->
    console.log "test"
    event.preventDefault()
    updateUser()

  'submit form': ->
    event.preventDefault()
    updateUser()

