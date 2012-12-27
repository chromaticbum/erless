var less = require("./less.js/lib/less");
var path = require("path");
var fs = require("fs");

var compile = function(input) {
  var result;

  fs.readFile(input, "", function(e, data) {
    var parser = new less.Parser({
      paths: [path.dirname(input)],
      filename: input
    });

    parser.parse(data, function(err, tree) {
      if(err) {
        return;
      } else {
        result = tree.toCSS();
      }
    });
  });

  return result;
};
