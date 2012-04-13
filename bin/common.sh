function die() {
	echo "$1" >&2
	exit 1
}

if [ ! "$GDCL" ] ; then
	GDCL=`which gdi.sh 2>/dev/null`
fi
if [ ! "$GDCL" ] ; then
	if [ ! "$GDCL_HOME" ] ; then
		die "Cannot find the GoodData CL tool. Options: put gdi.sh to path, define GDCL env var pointing to gdi.sh or defined the GDCL_HOME pointing to the GoodData-CL directory"
	fi
	GDCL="$GDCL_HOME/bin/gdi.sh"
fi

. `dirname "$0"`/config.sh
