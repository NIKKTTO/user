@hasAnyFields = (list, fields) ->
  for li in list
    return true if li in fields
  false

Meteor.users.allow
  update: (userId, doc, fields) ->
    (doc._id is userId and !hasAnyFields(['roles', 'restricted', 'disabled'], fields)) or Roles.userIsInRole userId, ['admin']
