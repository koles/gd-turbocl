#!/bin/sh

set -e

. bin/datasets.txt

for i in $datasets ; do
	bin/guess.sh "$i"
done
