#!/bin/sh

set -e

. `dirname "$0"`/common.sh

DATASET="$1"
CSV_FILE="$DATA_DIR/${DATASET}.csv"
CONFIG_FILE="$MODEL_DIR/${DATASET}.config.xml"
PROJECT="${2:-$(cat tmp/pid)}"
UPDATE="${3:-}"

if [ ! "$CONFIG_FILE" ] ; then
	die "Usage: $0 <dataset> [<project> [<update_flag>]]"
fi

if [ $UPDATE ] ; then
	command='GenerateUpdateMaql'
else
	command='GenerateMaql'
fi

script="
    OpenProject(id = \"$PROJECT\");
    UseCsv(hasHeader=\"true\", csvDataFile=\"$CSV_FILE\", configFile=\"$CONFIG_FILE\");
    $command(maqlFile=\"tmp/${DATASET}.maql\"); "

echo "$script"
"$GDCL" -e "$script"

