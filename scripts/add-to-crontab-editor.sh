#!/bin/bash

sleep 2 # crontab checks the timestamp of the file. It must be at least one second different.
cat >> "$1"
