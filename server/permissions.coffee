Meteor.users.allow
  update: (userId, doc, fields) ->
    (doc._id is userId and ['roles', 'restricted'] not in fields) or Roles.userIsInRole userId, ['admin']
