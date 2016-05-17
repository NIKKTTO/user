pbAuth = ->
  u = Meteor.user()
  mlt = $.cookie 'meteor_login_token'
  if mlt? and Meteor.settings.public.auth
    # $.cookie Meteor.settings.public.auth.cookie, mlt,
    #   domain: Meteor.settings.public.auth.domain
    #   expires: 20000
    #   path: '/'
    if Roles.userIsInRole(u, 'admin')
      Meteor.call 'stagingAuth', (e, r) ->
        if e?
          return setTimeout pbAuth, 1000
        $.cookie 'stagingAuth', r,
          domain: 'nikktto.com'
          expires: 20000
          path: '/'
        if location.hash is '#builder'
          location.href = Meteor.settings.public.builderAddress
    else if location.hash is '#builder'
      location.href = Meteor.settings.public.builderAddress
      

Meteor.startup ->
  Tracker.autorun ->
    u = Meteor.user()
    if u?
      pbAuth()
    else
      $.removeCookie Meteor.settings.public.auth.cookie,
        domain: Meteor.settings.public.auth.domain