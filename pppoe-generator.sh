#!/bin/bash

FILE=userandpass.txt
MAX_LOGINS=10
IFACE=wlp0s20f3
TRIES=80


declare counter=0
for i in $(cat $FILE); do

	if [ "$counter" = "$MAX_LOGINS" ]; then break; fi

	username=$(echo $i | cut -f1 -d ';' -s)
	password=$(echo $i | cut -f2 -d ';' -s)

	echo -en $username "*" $password "*\n" >> "/etc/ppp/chap-secrets"
	echo -en $username "*" $password "*\n" >> "/etc/ppp/pap-secrets"

	pppd pty "/usr/sbin/pppoe -I wlp0s20f3 -T $TRIES -U  -m 1412" noipdefault noauth default-asyncmap hide-password nodetach usepeerdns mtu 1492 mru 1492 noaccomp nodeflate nopcomp novj novjccomp user $username lcp-echo-interval 5 lcp-echo-failure 3&
	counter=$((counter+1))
done