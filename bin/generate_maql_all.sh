#!/bin/sh

set -e

. bin/datasets.txt

for dataset in $datasets ; do
	bin/generate_maql.sh "$dataset"
done
