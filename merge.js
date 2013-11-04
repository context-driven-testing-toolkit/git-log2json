/*
 * OPTIONAL: use this Node.js expression to merge the data structures
 * created by the two shell scripts above
 */

var ___, gitLog, lstat;

___ = require('underscore');
gitLog = require('git-log.json');
lstat = require('git-stat.json');

/* merge the two data structures */
gitLog.map(function(o){
    o.stat = lstat[o.commit];
});
