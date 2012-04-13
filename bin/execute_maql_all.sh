#!/bin/sh

. `dirname "$0"`/common.sh

set -e

. bin/datasets.txt

if [ "$*" ] ; then
	datasets="$*"
fi

for dataset in $datasets ; do
	file="tmp/${dataset}.maql"
  if [ -r "$file" ] ; then
 	  bin/execute_maql.sh "$file"
  else
    echo "Skipping missing '$file'"
  fi
done

if [ -r "model/post_create.maql" ] ; then
  bin/execute_maql.sh "model/post_create.maql"
fi
