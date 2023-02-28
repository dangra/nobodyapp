#!/bin/sh

whoami

if touch /data/file; then
	echo "/data/file created or updated successfully"
else
	echo "Error creating /data/file"
fi

# try creating subdirs
mkdir -p /data/a/b/c || echo "ERROR"
touch /data/a/b/c/d || echo "ERROR"

sleep inf
