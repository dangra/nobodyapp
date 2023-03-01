#!/bin/sh

echo "$0 running as '$(whoami)'"

if touch /data/file; then
	echo "/data/file created or updated successfully"
else
	echo "Error creating /data/file"
fi

# try creating subdirs
mkdir -p /data/a/b/c || echo "ERROR"
touch /data/a/b/c/d || echo "ERROR"

# List files with its permissions
find /data -exec ls -ld {} \;

sleep inf
