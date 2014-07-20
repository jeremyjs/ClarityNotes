Template.sidebar.events
  'click .logout': ->
    Meteor.logout()
    Router.go '/login'
