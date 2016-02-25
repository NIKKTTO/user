Package.describe({
  summary: "Nikktto User",
  version: "1.0.0",
  name: "nikktto:user",
});

Package.onUse(function(api){
  api.use([
    'accounts-base',
    'service-configuration',
    'coffeescript',
    'aldeed:simple-schema'
  ]);

  api.addFiles([
    'client/init.coffee'
  ]);

  api.addFiles([
    'server/init.coffee',
    'server/permissions.coffee'
  ], 'server');

  api.addFiles([
    'user.coffee'
  ]);
});