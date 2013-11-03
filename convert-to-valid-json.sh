#!/usr/bin/env bash

# Use this one-liner to produce a JSON object literal from the
# output of the Git JSON log format:

git log-json | \
    perl -pe 'BEGIN{print "{"}; s/}/},/; END{print "}\n"}'  | \
    perl -pe 's/},}/}}/'
