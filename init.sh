#!/bin/sh

whoami

if touch /data/file; then
	echo "/data/file created or updated successfully"
else
	echo "Error creating /data/file"
fi
sleep inf
