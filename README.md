# FR - Replace Livebox with an openwrt router (ipv4,ipv6 & TV).

#Version 1.1 22/02/19 => correction sur la gateway qui était présente sur l'interface vlan 840 (du coup Luci affichait ce wan en page d'accueil au lieu du vlan 832).
#Vous pouvez retrouver le tuto ici : https://lafibre.info/remplacer-livebox/remplacement-de-la-livebox-par-un-routeur-openwrt-18-dhcp-v4v6-tv
#Crée par ubune, le 20/02/19
#Version eth0 + eth1, exemple pour la gamme Linksys WRT.
# Version eth0 uniquement, exemple pour l'ubiquiti edge router X.

Mise en service : 

Avant de remplacer les fichiers de configuration de votre routeur par ceux-ci il faut :

- Installer les paquets nécéssaires : 
opkg update && opkg install nano tcpdump igmpproxy ip-full iptables-mod-ipopt luci-ssl xxd
- Ensuite on demarre luci et on active le lancement automatique d'igmpproxy :
/etc/init.d/uhttpd start
/etc/init.d/igmpproxy start
/etc/init.d/igmpproxy enable
- On converti votre FTI en hexa :
echo -n 'fti/qpq8888' | xxd  -p # Bien sûr il faut remplacer qpq8888 par votre vrai FTI.

- On decompresse l'archive, et on édite le fichier /etc/config/network =>
- Vous remplacer 6674692f71707138383838 par votre nouveau FTI, uniquement présent dans le fichier /etc/config/network (avec notepad on peut utiliser la commande remplacer, si vous voulez être sûr de ne pas faire d'erreur.

Une fois votre fichier network enregistré, vous copiez tous les fichiers présents dans le repertoire précédemment décompressé dans votre routeur, ne pas ommetre de fichier !

Si vous avez un décodeur TV5, il faut aussi gérer l'option 125 dans le fichier /etc/config/dhcp, il faut remplacer les XX par le n° de serie de votre livebox routeur converti en Hexa.

Une fois tout ceci fait, plus qu'à redemarrer le routeur, et brancher votre décodeur TV sur le port 3 !
Et tout devrait fonctionner ;)