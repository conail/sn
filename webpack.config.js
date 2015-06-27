var path = require('path');
var webpack = require('webpack');
 
module.exports = {
  context: path.join(__dirname + "/src"),
  entry: "./webapp/app.cjsx",
  output: {
    path: path.join(__dirname + "/src/public/js"),
    filename: "bundle.js"
  },
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module: {
    loaders: [
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  }
};
