Meteor.users.allow
  update: (userId, doc) ->
    doc._id is userId or Roles.userIsInRole userId, ['admin']