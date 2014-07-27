if Meteor.isServer
  Meteor.startup ->
    createUser('test', 'test') unless Meteor.users.find({'email': 'test'})
