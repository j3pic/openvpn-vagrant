#!/bin/bash

if [ -z "$1" ]; then
	git log | grep ^commit | head -n 1 | awk '{ print $2 }'
else
	git log "$@" | grep ^commit | head -n 1 | awk '{ print $2 }'
fi
