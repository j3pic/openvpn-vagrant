for i in enp0s8 ens4; do
  if ifconfig $i > /dev/null 2>&1; then
	interface=$i
	break
  fi
done

if [ -z "$interface" ]; then
	echo "Could not determine which network interface to use!"
	exit 1
fi

case $interface in
	enp0s8)
		echo vagrant
		;;
	ens4)
		echo google
		;;
esac
