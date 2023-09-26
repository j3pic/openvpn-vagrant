#!/bin/sh

# enp0s8 is used in Vagrant.
# ens4 is used on Google Compute Engine VM instances.

for i in enp0s8 ens4; do
  if ifconfig $i > /dev/null 2>&1; then
	interface=$i
	break
  fi
done

if [ -z "$interface" ]; then
	echo "Could not determine which network interface to use!" 1>&2
	echo 'ifconfig output:' 1>&2
	echo 1>&2
	ifconfig 1>&2
	exit 1
fi

exec ifconfig $interface | grep inet | grep -v inet6 | awk '{ print $2 }'
