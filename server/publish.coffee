Meteor.publish 'me', ->
  Meteor.users.find @userId,
    fields:
      'services.twitter.screenName': 1
      'services.facebook': 1