pbAuth = ->
  u = Meteor.user()
  mlt = $.cookie 'meteor_login_token'
  console.log(u, mlt)
  if mlt? and Meteor.settings.public.auth
    $.cookie Meteor.settings.public.auth.cookie, mlt,
      domain: Meteor.settings.public.auth.domain
      expires: 20000
      path: '/'
    if !window.PageBuilder and Roles.userIsInRole(u, 'admin')
      Meteor.call 'stagingAuth', (e, r) ->
        if e?
          return setTimeout pbAuth, 1000
        $.cookie 'stagingAuth', r,
          domain: Meteor.settings.public.auth.domain
          expires: 20000
          path: '/'
        $.cookie 'staging2Auth', r,
          domain: Meteor.settings.public.auth.domain
          expires: 20000
          path: '/'
    if location.hash is '#builder'
      location.href = Meteor.settings.public.builderAddress
    if location.hash is '#builder2'
      location.href = Meteor.settings.public.builder2Address


Meteor.startup ->
  Tracker.autorun ->
    u = Meteor.user()
    if u?
      pbAuth()
    else
      $.removeCookie Meteor.settings.public.auth.cookie,
        domain: Meteor.settings.public.auth.domain
