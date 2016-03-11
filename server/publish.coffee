Meteor.publish 'me', ->
  if @userId and @userId?.stripeId and !Meteor.users.findOne(@userId).cards
    cards = stripeFlow.getCards()
    if cards.data?.length
      Meteor.users.update @userId, $set: cards: cards.data
  Meteor.users.find @userId,
    fields:
      cards: 1
      emails: 1
      'services.twitter.screenName': 1
      'services.facebook.name': 1
      hidden: 1
      stripeId: 1
