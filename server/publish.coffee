Meteor.publish 'me', ->
  Meteor.users.find @userId,
    fields:
      hidden: 1
      'services.twitter.screenName': 1
      'services.facebook': 1
      stripeId: 1