#!/bin/bash

cat /etc/hosts | grep '[[:space:]]'"$1"'$' | awk '{ print $1 }'
