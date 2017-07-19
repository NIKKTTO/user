Meteor.users.allow
  update: (userId, doc, fields) ->
    (doc._id is userId and 'roles' not in fields and 'restricted' not in fields) or Roles.userIsInRole userId, ['admin']
