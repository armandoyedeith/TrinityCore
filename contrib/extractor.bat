@ECHO OFF
CLS

:MENU
ECHO.
ECHO ...............................................
ECHO Trinitycore dbc/db2, maps, vmaps, mmaps extractor
ECHO ...............................................
ECHO PRESIONA 1, 2, 3 O 4 to seleciona tu tarea, o 5 para salir.
ECHO ...............................................
ECHO.
ECHO ¡ADVERTENCIA! al extraer el extractor vmaps
ECHO envíe los textos a continuación, es intencionado y no un error:
ECHO ..........................................
ECHO Extrayendo World\Wmo\Band\Final_Stage.wmo
ECHO No existe tal archivo.
ECHO ¡¡¡No se pudo abrir RootWmo!!!
ECHO Hecho!
ECHO ..........................................
ECHO No se puede abrir WDT para el mapa <un número> - <un nombre> (FileNameID <número>): ARCHIVO NO ENCONTRADO
ECHO ..........................................
ECHO.
ECHO Presiona 1, 2, 3 o 4 para comenzar a extraer o 5 para salir.
ECHO 1 - Extraer archivos base (NECESARIOS) y cámaras..
ECHO 2 - Extraiga vmaps (es necesario extraer los mapas antes de ejecutar esto) (OPCIONAL, muy recomendado)
ECHO 3 - Extraiga mmaps (es necesario extraer vmaps antes de ejecutar esto, puede llevar horas) (OPCIONAL, muy recomendado)
ECHO 4 - Extraer todo (puede tardar horas)
ECHO 5 - Salir
ECHO.
SET /P M=Type 1, 2, 3, 4 or 5 Despues presionar ENTER:
IF %M%==1 GOTO MAPS
IF %M%==2 GOTO VMAPS
IF %M%==3 GOTO MMAPS
IF %M%==4 GOTO ALL
IF %M%==5 GOTO :EOF

:MAPS
start /b /w mapextractor.exe
GOTO MENU

:VMAPS
start /b /w vmap4extractor.exe
start /b /w vmap4assembler.exe Buildings vmaps
rmdir Buildings /s /q
GOTO MENU

:MMAPS
ECHO Esto puede tardar algunas horas en completarse. Por favor tenga paciencia.
PAUSE
start /b /w mmaps_generator.exe
GOTO MENU

:ALL
ECHO sto puede tardar algunas horas en completarse. Por favor tenga paciencia.
PAUSE
start /b /w mapextractor.exe
start /b /w vmap4extractor.exe
start /b /w vmap4assembler.exe
rmdir Buildings /s /q
start /b /w mmaps_generator.exe
GOTO MENU
