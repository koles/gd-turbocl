#!/bin/sh

. `dirname "$0"`/common.sh

set -e

MAQL_FILE="$1"
PROJECT="${2:-$(cat tmp/pid)}"

if [ ! $MAQL_FILE ] ; then
	echo "Usage: $0 <mqal_file> [<projectid>]" >&2
	exit 1
fi

echo 
echo $MAQL_FILE
echo ========
script="
  OpenProject(id = \"$PROJECT\");
  ExecuteMaql(maqlFile=\"$MAQL_FILE\"); "
echo "$script"
"$GDCL" -e "$script"
