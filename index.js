// This is only used for parcel builds. This will be ignored in the "prod" build
var Main = require('./output/Main');

function main () {
  Main.main();
}

if (module.hot) {
  module.hot.accept(function() {
    console.log("Reloaded, running main again");
    main();
  });
}

main();
