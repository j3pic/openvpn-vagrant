#!/bin/bash

set -e -o pipefail
export PATH=/snap/bin:$PATH
gsutil cp "$2" /tmp/env
sudo mv /tmp/env /
sudo chmod a+r /env
. /env
cd /vagrant
sudo -E su - -c "$1" 2>&1
