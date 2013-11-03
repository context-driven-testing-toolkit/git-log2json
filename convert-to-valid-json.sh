# Use this one-liner to produce a JavaScript object literal from the
# output of the JSON log format:

git log-json | \
    perl -pe 'BEGIN{print "{"}; s/}/},/; END{print "}\n"}'  | \
    perl -pe 's/},}/}}/'
