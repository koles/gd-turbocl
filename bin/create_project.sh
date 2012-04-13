#!/bin/sh

. `dirname "$0"`/common.sh

PROJECT_NAME="$1"

if [ ! "$PROJECT_NAME" ] ; then
	die "Usage: $0 <project name>"
fi

"$GDCL" -e "
	CreateProject(name=\"$PROJECT_NAME\");
	StoreProject(fileName=\"tmp/pid\");
  "

. `dirname "$0"`/create_date_dimensions.sh
