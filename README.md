# FR - Replace Livebox for an openwrt router (ipv4,ipv6 & TV).

- Version 19.07 eth0 + eth1, exemple pour la gamme Linksys WRT.
- Version 19.07 eth0 uniquement, exemple pour l'ubiquiti edge router X.
- Version 22.03, attention l'interface wan se nomme eth0 ici, sur certains routeurs elle se nomme "wan".

# Mise en service (22.03 et supérieur, Internet uniquement): 

- Vérifiez le nommage de votre interface "wan", si ce n'est pas "eth0" mais eth1 par ex, il faudra remplacer eth0 par eth1 dans tous les fichiers de configurations.
- Récupérez le /etc 22.03 et collez le dans votre routeur (en remplacement).
- Remplacez "XAUTH" dans /etc/config/network (2 occurences) par votre vrai FTI généré à l'aide du script de Kgersen ici : https://jsfiddle.net/kgersen/3mnsc6wy/
Enjoy ;)

# Mise en service (22.03 et supérieur, Internet +TV): 

- Vérifiez le nommage de votre interface "wan", si ce n'est pas "eth0" mais eth1 par ex, il faudra remplacer eth0 par eth1 dans tous les fichiers de configurations.
- Récupérez le /etc (22.03 avec tv) et collez le dans votre routeur (en remplacement).
- Remplacez "XAUTH" dans /etc/config/network (2 occurences) par votre vrai FTI généré à l'aide du script de Kgersen ici : https://jsfiddle.net/kgersen/3mnsc6wy/
- Installez igmpproxy : opkg update && opkg install igmpproxy
- Remplacer les X et Y de l'option 125 dans /etc/config/dhcp

Pour les "XX", convertissez votre numéro de serie de la livebox tv (ascii vers hex)
Exemple : IA2022323438110 devient 494132303232333233343338313130

Pour les "YY", on prend les 3 premiers octects de la mac, à convertir en Hex également.
Exemple : 08:87:C6:B2:D1:90 soit 0887C6 devient 303838374336

Enjoy ;)

# Mise en service (19.07 et inférieur) : 

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
Enjoy ;)


# Vous pouvez retrouver mon tuto complet ici :
https://lafibre.info/remplacer-livebox/remplacement-de-la-livebox-par-un-routeur-openwrt-18-dhcp-v4v6-tv

