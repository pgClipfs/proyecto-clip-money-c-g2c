Este Readme esta para seguir el protocolo de pusheo y mergeo de los repositorios locales a este repo. A continuacion se pondran los pasos a seguir, usando la consola de git y usando la plataforma de github.

En la consola de git, en el mismo directorio donde se encuentre la carpeta .git (si no lo ven activen la opcion de ver carpetas ocultas):
1. si no se tiene el repositorio:
    * clonar repositorio como zip y extraer en directorio a eleccion
    * usar la consola->git clone url y clonar el repo en el directorio en donde se abrio la consola
    * abrir la consola de git en un directorio a eleccion y escribir de la sig forma -> git init -> git remote add origin la url del git -> git pull
2. segundo (si no se desea pushear al repo por cualquiera sea la razon, si se desea pushear pasar al paso 3):
    * git status ->corroborar si hay cambios dos opciones desde aqui
    * si hay cambios y queremos guardarlo ->git checkout -b feature/"nombre de la rama"
       *  luego ->git add . -> git commit -m "mensaje" (tipo telegrama preferentemente) \
        (Esta rama es local para guardar los cambios que hice pero no se va a sincronizar con el repo remoto)
    * si hay cambios pero no quiero guardarlos -> git stash
3. tercero:
    git checkout develop (te va a parar en la rema develop)
4. cuarto:
    git pull origin develop (actualiza la rama develop local)
5. quinto:
    git checkout -b feature/"nombre de rama 2" (rama donde vas a trabajar con la feature)
6. sexto:
    trabajar normalmente con esta rama
7. septimo:
    una vez terminado -> git add . -> git commit -m "mensaje" (tipo telegrama preferentemente)
8. octavo:
    git push origin feature/"nombre de rama 2"
9. noveno:
    ir a la pagina de gihub y crear un pull request de la rama creada a develop
10. decimo:
    hacer el code review y aceptacion de los cambios
11. decimo primero:
    realizar el merge entre la rama develop y la feature con la que trabajaste
12. decimo segundo:
    eliminar la rama con la que trabajaste

Evitemos trabajar con la rama develop y main directamente y usemos solo esas rama para hacer los merges.
El segundo paso siver para cuando no estamos tan seguro de lo que queramos hacer en ese momento y no quieren
sincronizarlo en ese momento, si lugo re utilizan ese codigo mergear de forma local con su segunda rama 'feature/"nombre de rama 2"'
y continuen desde el paso 6.

documento creado por Karen Cerrone con el Colaborador Ariel Navarro

Este documento puede estar sujeto a cambios
