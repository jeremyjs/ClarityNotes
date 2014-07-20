# if Meteor.isServer
#   Meteor.startup ->
#     if Documents.find().count() == 0
#       Documents.insert
#         id: 1
#         title: 'Test Document'
