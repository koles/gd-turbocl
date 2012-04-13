#!/bin/sh

. `dirname "$0"`/common.sh

DATASET="$1"
CSV_FILE="$DATA_DIR/${DATASET}.csv"
CONFIG_FILE="$MODEL_DIR/${DATASET}.config.xml"
FOLDER="${2:-$DATASET}"

if [ ! "$FOLDER" ] ; then
	die "Usage: $0 <dataset> [<folder>]"
fi

"$GDCL" -e "GenerateCsvConfig(
	csvHeaderFile=\"$CSV_FILE\",
	configFile=\"$CONFIG_FILE\",
	defaultFolder=\"$FOLDER\");"

schema=`basename "$CSV_FILE" | sed 's,\.csv$,,'`
perl -p -i -e "s|<name>$schema</name>|<name>$FOLDER</name>|" "$CONFIG_FILE"
