# FR - Replace Livebox with an openwrt router (ipv4,ipv6 & TV).

- Version eth0 + eth1, exemple pour la gamme Linksys WRT.
- Version eth0 uniquement, exemple pour l'ubiquiti edge router X.

# Mise en service : 

Avant de remplacer les fichiers de configuration de votre routeur par ceux-ci :

- Installez les paquets nécéssaires :  
opkg update && opkg install nano tcpdump igmpproxy ip-full iptables-mod-ipopt luci-ssl xxd
- Démarrez luci et activez le lancement automatique d'igmpproxy :  

/etc/init.d/uhttpd start  
/etc/init.d/igmpproxy start  
/etc/init.d/igmpproxy enable  

- Convertissez votre FTI en hexa (fti/qpq8888 = valeur créée pour l'exemple des fichiers de configuration):  
echo -n 'fti/qpq8888' | xxd  -p 

- Récupérez les fichiers et éditez /etc/config/network :  
Remplacez 6674692f71707138383838 par votre vrai FTI

Une fois votre fichier network enregistré, copiez tous les fichiers dans votre routeur en respectant l'arborescence, n'oubliez aucun fichier !

Si vous avez un décodeur TV5, il faut aussi gérer l'option 125 dans le fichier /etc/config/dhcp, il faut remplacer les XX par le n° de serie de votre livebox routeur converti en Hexa.

Une fois tout ceci fait, plus qu'à redemarrer le routeur, et brancher votre décodeur TV sur le port 3 !
Et tout devrait fonctionner ;)


# Vous pouvez retrouver mon tuto complet ici :
https://lafibre.info/remplacer-livebox/remplacement-de-la-livebox-par-un-routeur-openwrt-18-dhcp-v4v6-tv

# If you like this depo, buy me a Coffee ! =)
- [Paypal](https://paypal.me/pools/c/8wGwagGlFS) 
