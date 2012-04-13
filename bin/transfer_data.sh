#!/bin/sh

set -e

. `dirname "$0"`/common.sh

DATASET="$1"
CSV_FILE="$DATA_DIR/${DATASET}.csv"
CONFIG_FILE="$MODEL_DIR/${DATASET}.config.xml"
PROJECT="${2:-$(cat tmp/pid)}"

if [ ! "$DATASET" ] ; then
	die "Usage: $0 <dataset> [ <project> ]"
fi

"$GDCL" -e "
    OpenProject(id = \"$PROJECT\");
    UseCsv(hasHeader=\"true\", csvDataFile=\"$CSV_FILE\", configFile=\"$CONFIG_FILE\");
    TransferData(incremental=\"false\");"
