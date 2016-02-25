#/bin/sh
#
# Returns a list of dEQP tests that didn't pass.
#

if [ "$1" == "" ] ; then
    echo "Usage: $0 <xml_results_file>" && exit 0
fi

cat $1 | tr -d '\n' | \
    sed 's/#beginTestCaseResult \|#endSession/\n-----\n/g' | \
    sed -n 's/^\(.*\)<?xml.*StatusCode="Fail".*/      * \1/p'
