# Use this one-liner to produce a JavaScript object literal from the
# output of the JSON log format:

git log-json -n5 | \
    perl -pe 'BEGIN{print "var git_log = {"}; s/}/},/; END{print "};\n"}'
