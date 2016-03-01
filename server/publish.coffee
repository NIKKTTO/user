Meteor.publish 'me', ->
  Meteor.users.find @userId,
    fields:
      'emails': 1
      'services.twitter.screenName': 1
      'services.facebook.name': 1
      hidden: 1
      stripeId: 1
