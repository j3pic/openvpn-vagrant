#!/bin/bash

set -e -o pipefail

/vagrant/scripts/import-gpg-keys.sh

pict_dir="$1"
cd "$pict_dir"
bin/git-crypt-unlock
