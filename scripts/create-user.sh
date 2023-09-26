#!/bin/bash

set -e -o pipefail

username="$1"
shift

echo 'auth       sufficient pam_rootok.so' > /etc/pam.d/groupmems

useradd -m -s /bin/bash $username
for group in "$@"; do
	groupmems -g "$group" -a "$username"
done
