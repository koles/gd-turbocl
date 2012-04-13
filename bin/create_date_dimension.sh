#!/bin/sh

. `dirname "$0"`/common.sh

PROJECT="$1"
DATE_DIM_NAME="$2"

if [ ! "$DATE_DIM_NAME" ] ; then
	die "Usage: $0 <project> <date dimension name>"
fi

maql_file_name="`echo $DATE_DIM_NAME | tr '[A-Z]' '[a-z]'| tr -d ' '`date"

$GDCL -e "
    OpenProject(id=\"$PROJECT\");
	UseDateDimension(name=\"$DATE_DIM_NAME\");
	GenerateMaql(maqlFile=\"tmp/$maql_file_name.maql\");
	ExecuteMaql(maqlFile=\"tmp/$maql_file_name.maql\");"

