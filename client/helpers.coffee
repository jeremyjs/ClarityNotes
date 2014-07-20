@capitalize = (string) ->
  string.split(' ').map (word) ->
    word[0].toUpperCase() + word[1..-1].toLowerCase()
  .join ' '

@userEmail = ->
  Meteor.user()['emails'][0]['address']

@user = ->
  @userEmail().replace /@.*/, ""

@toggleSession = (variable) ->
  if Session.get variable
    Session.set variable, false
  else
    Session.set variable, true

