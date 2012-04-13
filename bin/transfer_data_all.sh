#!/bin/sh

set -e

. bin/datasets.txt

for dataset in $datasets ; do
  bin/transfer_data.sh "$dataset"
done
