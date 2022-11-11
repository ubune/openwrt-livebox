#!/bin/sh
var=$(nft list ruleset | grep "set 0:" | wc -l);
if [ $var -ne 0 ]; then
    echo "nft rules ok le $(date)" > /root/checkrules.txt
else
echo "nft rules corrige par le script le $(date)" >> /root/error-rules.txt
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" counter meta priority set 0:1
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" ip protocol icmpv6 counter meta priority set 0:6
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" udp dport 547 counter meta priority set 0:6
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" ip protocol icmp counter meta priority set 0:6
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" ip protocol igmp counter meta priority set 0:6
nft add rule inet fw4 mangle_postrouting oifname "eth0.832" udp dport 67 counter meta priority set 0:6
fi

