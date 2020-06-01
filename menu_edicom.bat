@echo off
::@autor jesus.sanchez
::version 1.0
::batch que permite hacer las funciones basicas de un certificado (instalar, eliminar, mostrar)
::y lo instala en el keystore de java

::TODO: se puede mejorar el manejo de errores, por ejemplo cuando no existe un certificado o cuando no se puede eliminar


::url cacerts
::MODIFICAR estas URL por las que se tengan en el PC 
SET path_security=C:\Program Files\Java\jdk1.8.0_211\jre\lib\security
SET path_cacerts="C:\\Program Files\\Java\\jdk1.8.0_211\\jre\\lib\\security\\cacerts"

:: obtiene el path actual para que al terminar el programa regrese al mismo path
SET path_batch=%~dp0
echo %mypath:~0,-1%

CLS
:MENU
ECHO .....................................................
ECHO		 EDICOM CERTIFICATE
ECHO PRESS 1,2,3,4 OR 5 to select your task, or 6 to EXIT.
ECHO .....................................................
ECHO.
ECHO 1 - Show certificate
ECHO 2 - Show all certificate
ECHO 3 - Install certificate
ECHO 4 - Delete certificate
ECHO 5 - Clear screen
ECHO 6 - Exit
ECHO.

::menu con las opciones
SET /P M=Type 1, 2, 3, 4 , 5 or 6 then press ENTER:
IF %M%==1 GOTO SHOW
IF %M%==2 GOTO SHOWALL
IF %M%==3 GOTO INSTALL
IF %M%==4 GOTO DELETE
IF %M%==5 GOTO CLEAR
IF %M%==6 GOTO EXIT

::muestra el certificado a partir del alias que recibe como parametro
:SHOW
SET /P Nombre= Escriba el alias del certificado:
:: cambiar la url en la que esta el cacerts
cd %path_security%
:: enlista el certificado
keytool -list -alias %Nombre% -keystore cacerts -v -storepass changeit
GOTO MENU


::muestra todos los certificados instalados
:SHOWALL
:: cambiar la url en la que esta el cacerts
cd %path_security%
:: enlista todos los certificados
keytool -list -keystore cacerts -storepass changeit | more
GOTO MENU


::instala el certificiado son necesarios dos parametros
::nombre:el nombre del archivo con extension
::alias: el nombre que tendra en el keystores
:INSTALL
SET /P Nombre= Escriba el nombre del certificado con extension:
SET /P Alias= Escriba el alias del certificado:
cd %path_security%
keytool -import -alias %Alias% -keystore %path_cacerts% -file %~dp0\\%Nombre% -storepass changeit
GOTO MENU

::eliminar un certificado a partir del alias
:DELETE
ECHO Se necesitan privilegios de admin para poder eliminar un certificado.
::obtiene el alias del certificado
SET /P Alias= Escriba el alias del certificado:

:: cambiar la url en la que esta el cacerts
cd %path_security%

:: enlista el certificado
keytool -list -alias %Alias% -keystore cacerts -v -storepass changeit

ECHO Desea eliminar el certificado?[Y/N]
choice /c YN
if %errorlevel%==1 goto yes
if %errorlevel%==2 goto no
:yes
keytool -delete -alias %Alias% -keystore cacerts  -storepass changeit

ECHO certificado %Alias% eliminado

:: ruta del batch 
cd %path_batch%
:: regresa al menu inicial
GOTO MENU

:: si no quieren eliminar el certificado
:no
ECHO no se elimino el certificado %Alias%
:: ruta del batch 
cd %path_batch%
GOTO MENU

:EXIT
cd %path_batch%
ECHO .....................................................
ECHO 	EXIT PROGRAM
ECHO .....................................................
goto :eof

:CLEAR
cls
GOTO MENU

pause