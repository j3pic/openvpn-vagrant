#!/bin/bash

cat /etc/hosts | grep '^'$1'[[:space:]]' | awk '{ print $2 }'
