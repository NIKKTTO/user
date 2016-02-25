Meteor.startup ->
  ServiceConfiguration.configurations.upsert(
    {service: 'facebook'}
    {
      $set:
        appId: Meteor.settings.facebook.appId
        secret: Meteor.settings.facebook.secret
    }
  )

  ServiceConfiguration.configurations.upsert(
    {service: 'twitter'}
    {
      $set:
        consumerKey: Meteor.settings.twitter.consumerKey
        secret: Meteor.settings.twitter.secret
    }
  )