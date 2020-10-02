bienvenidos al proyecto de la billetera virtual.

probablemente tengan problemas para subir repos por que les dice:

"fatal: unable to auto-detect email address"

En ese caso necesitan modificar la configuracion del repo.
Para eso bien pueden en una terminal, en el directorio de la
repo local, escribir "git config --global user.email 'email'" y "git config --global user.name 'nombre'" y ahi pueden hacer hel commit y los subsecuentes pushs. SI no pueden hacerlo por terminal, vayan a la repo local y busquen la opcion para ver carpetas ocultas, van a ver la carpeta .git y van a ver el carchivo config, y pueden editarlo con un editor de texto (visual studio). Abren config e insertan esto:

[user]
	email = "su mail"
	name = "su nombre o nick"

guardan los cambios y eso es todo, ya pueden hacer el commit

hola chicos!