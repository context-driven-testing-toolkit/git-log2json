#!/usr/bin/env bash

# OPTIONAL: use this stand-alone shell script to produce a JSON object
# with information similar to git --stat.
#
# You can then easily cross-reference or merge this with the JSON git
# log, since both are keyed on the commit hash, which is unique.

git log \
    --numstat \
    --format='%H' \
    $@ | \
    perl -lawne '
        if (defined $F[1]) {
            print qq#{"insertions": "$F[0]", "deletions": "$F[1]", "path": "$F[2]"},#
        } elsif (defined $F[0]) {
            print qq#],\n"$F[0]": [#
        };
        END{print qq#],#}' | \
    tail -n +2 | \
    perl -wpe 'BEGIN{print "{"}; END{print "}"}' | \
    tr '\n' ' ' | \
    perl -wpe 's#(]|}),\s*(]|})#$1$2#g' | \
    perl -wpe 's#,\s*?}$#}#'