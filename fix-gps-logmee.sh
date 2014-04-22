#!/bin/sh
#
# Fix GPS LogMee results, as the timeformat is not correct
#
# Juan A. Suarez Romero <jasuarez@igalia.com>  Tue, 22 Apr 2014 00:30:56 +0200
#

while read line; do
    line=`echo "$line" | sed -e 's/^[ \t]*//g'`
    case "$line" in
        '<time>'*)
            echo '<time>'
            date -d "`echo "$line" | sed -e 's/<time>//' -e 's-</time>--'`" --utc '+%FT%TZ'
            echo '</time>'
            ;;
        *)
            echo "$line"
            ;;
    esac
done < $1 > $2
