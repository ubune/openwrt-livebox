# FR - Remplacer une Livebox par un routeur OpenWrt (ipv4,ipv6 & TV).

- Version 19.07 eth0 + eth1, exemple pour la gamme Linksys WRT.
- Version 19.07 eth0 uniquement, exemple pour l'ubiquiti edge router X.
- Version 22.03, attention l'interface wan est eth0 ici, sur certains routeurs c'est plutôt "wan" ou "eth1".

## Mise en service (22.03 et supérieur, Internet uniquement): 

- Vérifier le nommage de l'interface "wan", si ce n'est pas "eth0" mais eth1 par ex, il faudra remplacer eth0 par eth1 dans tous les fichiers de configurations.
- Récupérer le /etc 22.03 et le coller dans le routeur (en remplacement).
- Remplacer "XAUTH" dans /etc/config/network (2 occurences) par le vrai FTI généré à l'aide du script de Kgersen ici : https://jsfiddle.net/kgersen/3mnsc6wy/
Enjoy ;)

## Mise en service (22.03 et supérieur, Internet +TV): 

- Vérifier le nommage de l'interface "wan", si ce n'est pas "eth0" mais eth1 par ex, il faudra remplacer eth0 par eth1 dans tous les fichiers de configurations.
- Récupérer le /etc (22.03 avec tv) et le coller dans le routeur (en remplacement).
- Remplacer "XAUTH" dans /etc/config/network (2 occurences) par le vrai FTI généré à l'aide du script de Kgersen ici : https://jsfiddle.net/kgersen/3mnsc6wy/
- Installer igmpproxy : `opkg update && opkg install igmpproxy`
- Remplacer les X et Y de l'option 125 dans `/etc/config/dhcp`

Pour les "XX", convertir le numéro de serie de la livebox tv (ascii vers hex)
Exemple : `IA2022323438110` devient `494132303232333233343338313130`

Pour les "YY", on prend les 3 premiers octects de la mac, à convertir en Hex également.
Exemple : `08:87:C6:B2:D1:90` soit `0887C6` devient `303838374336`

Enjoy ;)

## Mise en service (19.07 et inférieur) : 

Avant de remplacer les fichiers de configuration du routeur par ceux-ci :

- Installer les paquets nécessaires :  
```
opkg update && opkg install nano tcpdump igmpproxy ip-full iptables-mod-ipopt luci-ssl xxd
```
- Démarrer `luci` et activer le lancement automatique d'`igmpproxy` :  
```bash
/etc/init.d/uhttpd start
/etc/init.d/igmpproxy start
/etc/init.d/igmpproxy enable
```

- Convertir le FTI en hexa (fti/qpq8888 = valeur créée pour l'exemple des fichiers de configuration):  
```bash
echo -n 'fti/qpq8888' | xxd  -p
```

- Récupérer les fichiers et éditer `/etc/config/network` :  
Remplacer `6674692f71707138383838` par le vrai FTI

Une fois le fichier network enregistré, copier tous les fichiers dans le routeur en respectant l'arborescence, n'oublier aucun fichier !

Si décodeur TV5, il faut aussi gérer l'option 125 dans le fichier `/etc/config/dhcp`, il faut remplacer les XX par le n° de serie de la livebox routeur converti en Hexa.

Une fois tout ceci fait, plus qu'à redemarrer le routeur, et brancher le décodeur TV sur le port 3 !
Enjoy ;)

---
## Tuto complet ici :
https://lafibre.info/remplacer-livebox/remplacement-de-la-livebox-par-un-routeur-openwrt-18-dhcp-v4v6-tv
