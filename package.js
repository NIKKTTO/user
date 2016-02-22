Package.describe({
  summary: "Nikktto User",
  version: "1.0.0",
  name: "nikktto:user",
});

Package.onUse(function(api){
  api.use([
    'accounts-base',
    'coffeescript',
    'aldeed:simple-schema'
  ]);

  api.addFiles([
    'user.coffee'
  ]);
});