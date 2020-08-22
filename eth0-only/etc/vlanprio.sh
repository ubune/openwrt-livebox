#!/bin/sh
set -x
for i in 0 1 2 3 4 5 6 7; do
    ip link set eth0.832 type vlan egress $i:$i >/dev/null  ## Chaque file devient en priorité $numdefile
    ip link set eth0.840 type vlan egress $i:5 >/dev/null   ## tout en prio 5 sur le vlan 840

done
    ip link set eth0.832 type vlan egress 1:0 >/dev/null    ## La file (1) était donc en prio 1 on la repasse à 0, ça deviendra (via IPTABLES) la nouvelle file par défaut.
    ip link set eth0.832 type vlan egress 0:6 >/dev/null    ## Tout le flux devient en prio 6 ! sauf le flux qui passera par IPTABLES (donc juste nos requêtes dhcp)
