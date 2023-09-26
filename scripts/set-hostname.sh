#!/bin/bash

set -e -o pipefail

hostname "$1"
echo "$1" > /etc/hostname

