# install-certificate

Archivo .bat con opciones que permite mostrar/instalar/eliminar un certificado de seguridad en nuestra keytool de java. Para poder utilizarse es necesario abrir el archivo  y modificar dos variables:

- `SET path_security=C:\Program Files\Java\jdk1.8.0_211\jre\lib\security`
- `SET path_cacerts="C:\\Program Files\\Java\\jdk1.8.0_211\\jre\\lib\\security\\cacerts"`

**Opciones del menu**
1. [Show certificate](#show)
2. [Show all certificate](#all)
3. [Install certificate](#install)
4. [Delete certificate](#delete)
5. [Clear screen](#clear)
6. [Exit](#exit)

<div id='show' />

# 1. Show certificate 

mostrará el certificado instalado es necesario ingresar el `alias` del certificado

<div id='all' />

# 2. Show all certificate 
mostrará todos los certificados instalados, no es necesario ningun parametro.

<div id='install' />

# 3. Install certificate
Instalar un certificado en el keytools de java, es necesario tener el archivo `.cer` o `.der` en el mismo directorio en el que se encuentra el `.bat`

<div id='delete' />

# 4. Delete certificate
Borra un certificado en el keytools de java, es necearsio añadir el `alias` del certificado a eliminar.
Ejemplo:
`new_certificate`

<div id='clear' />

# 5. Clear screen
Limpiará la pantalla y volverá a mostrar el menu con las opciones

<div id='exit' />

# 6. Exit
Cerrará el programa

