#!/bin/sh

. `dirname "$0"`/datasets.txt

PROJECT=`cat tmp/pid`

for i in $date_dimensions ; do
  ./bin/create_date_dimension.sh $PROJECT $i
done
