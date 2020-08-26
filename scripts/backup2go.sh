#!/bin/sh

# Script to collect data
# and put the data into outputfile

CWD=$(dirname $0)
CACHEDIR="$CWD/cache/"
OUTPUT_FILE="${CACHEDIR}backup2go.txt"
SEPARATOR=' = '

# Skip manual check
if [ "$1" = 'manualcheck' ]; then
	echo 'Manual check: skipping'
	exit 0
fi

# Create cache dir if it does not exist
mkdir -p "${CACHEDIR}"

# check if the Archiware backup2go client is installed

if [ -f /usr/local/aw/bin/nsdchat ];
then
	/usr/local/aw/bin/nsdchat -c Server 10001 lastend > ${OUTPUT_FILE}
else
	echo "Backup2go  is not installed, skipping"
	exit 0
fi
