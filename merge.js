/*
 * OPTIONAL: use this Node.js expression to merge the data structures
 * created by the two shell scripts above
 */

var gitLog, lstat;

gitLog = require('git-log.json');
lstat = require('git-stat.json');

gitLog.map(function(o){
    o.stat = lstat[o.commit];
});
