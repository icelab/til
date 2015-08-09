var fs = require("fs");
var path = require("path");
var _ = require("lodash");

var Metalsmith = require("metalsmith");
var collections = require("metalsmith-collections");
var layouts = require("metalsmith-layouts");
var markdown = require("metalsmith-markdown");
var permalinks = require('metalsmith-permalinks');

Metalsmith(__dirname)
  .source("./content")
  .metadata({
    title: "TIL",
    description: "Today Icelab Learned.",
    topics: topicNames()
  })
  .use(collections(
    _.extend(topicCollectionConfig(), {
      "latest": {
        pattern: "*/*.md",
        sortBy: "date",
        reverse: "true",
        limit: 20
      }
    })
  ))
  .use(topicIndexPages())
  .use(markdown({
    smartypants: true,
    gfm: true,
    tables: true
  }))
  .use(permalinks())
  .use(layouts({
    engine: "jade",
    default: "post.jade"
  }))
  .build(function(err) {
    if (err) throw err;
  });

function topicIndexPages(options) {
  return function(files, metalsmith, done) {
    var indexPages = _.reduce(topicNames(), function(memo, topicName) {
      memo[topicName + ".html"] = {
        title: topicName,
        topic: topicName,
        layout: "topic.jade",
        contents: ""
      }
      return memo;
    }, {});

    _.extend(files, indexPages)
    done();
  }
}

function topicCollectionConfig() {
  return _.reduce(topicNames(), function(memo, topicName) {
    memo[topicName] = {
      pattern: topicName + "/*.md",
      sortBy: "title",
      refer: false
    };
    return memo;
  }, {});
}

function topicNames() {
  var baseDir = __dirname + "/content";

  return fs.readdirSync(baseDir).filter(function(file) {
    return fs.statSync(path.join(baseDir, file)).isDirectory();
  });
}
