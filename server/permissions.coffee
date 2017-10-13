@hasAnyFields = (list, fields) ->
  for li in list
    return true if li in fields
  false

Meteor.users.allow
  update: (userId, doc, fields) ->
    (doc._id is userId and !hasAnyFields([
      'roles'
      'restricted'
      'disabled'
      'subscriptionId'
      'renewedAt'
      'stripeCharges'
      'stripeProcessing'
      'referrer'
      'nReferrals'
      'nReferralsPaid'
      'referrals'
      'referralsPaid'
      'rewards'
      'lineQueuedAt'
      'linePosition'
      'hidden'
      'createdAt'
      'coins'
    ], fields))# or Roles.userIsInRole userId, ['admin']
