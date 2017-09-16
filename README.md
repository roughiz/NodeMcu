# Présentation

Dans ce répo on peut trouver quelques dossier avec des idées d'utilisation de notre NodeMcu (Joystick, jeu de lumière, boutons).
Il y'a aussi deux outils esptool et luatool qui permet de flasher leNodeMcu ou aussi pouvoir envoyer nos fichiers sur ledevice etc ...

## Explication : 
	

Pour reset le NodeMcu, il faudra apres l'avoir brancher utiiser l'utilitaire screen qui permet d'envoyer des commandes au NodeMcu 

Comme on l'a flashé avec le firmware Lua, on va pouvoir communiquer avec lui avec des commandes Lua 

Pour se conncter au device qui est en general à /dev/ttyUSB....., on lance la commande(on communique avec ce evice via le baud 9600 )  :

```
$ screen /dev/ttyUSB.... 9600
```

Pour faire un reset : node.restart()

Pour formater la carte memoire sd integrer : file.format()

On peut désormais lancer des commandes lua( comme avec l'intérpreteur python)

***

Si on veut flasher un fichier ou plusieurs dans notre device on doit utiliser un script python luatool.py  :

Note: on doit se deconnecter de screen pour pouvoir faire cela !!!!!!!!!!!!

### commande : 

```
$ python luatool.py --port /dev/ttyUSB0 --src init.lua --dest init.lua --verbose
$ python luatool.py --port /dev/ttyUSB0 --src main.lua --dest main.lua --verbose
```


Ou bien

```
$ nodemcu-tool upload init.lua 
```

### <span style="color:red"> Attention </span>

S'il ya plus moyen de faire quoi que se soit avec le nodemc il faut le re flasher à noueau avec le firmware :
 
``` 
$ python esptool/esptool  erase_flash
$ python esptool/esptool.py  --port /dev/ttyUSB0 write_flash 0x00000 nodemcu_float_0.9.6-dev_20150704.bin
```

***

On peut crééer une nouvelle version frirmware flashing (.bin) qui inculus l'ensemble de modules dans on souhaite sur le site : [Assemble] (http://nodemcu-build.com/index.php)
dnc on selectionne les modules on fait une demande et on recit le bin avec lequel on peut flasher notre MCU.

On peut trouver quelques firmware dans le dossier bin.




