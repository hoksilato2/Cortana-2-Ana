@echo off
color 0E
echo --------------------------------
echo     Cortana disponible en TTS
echo 		by cmdr. Hoksilato
echo --------------------------------
echo.
echo.
echo.
echo AVISO!
echo Este script tiene que ejecutarse como usuario administrador.
echo SOLO COMPATIBLE CON WINDOWS 10 x64
echo.
echo.
pause
cls
echo --------------------------------
echo     Cortana disponible en TTS
echo 		by cmdr. Hoksilato
echo --------------------------------
echo.
echo.
echo.

if not exist %userprofile%\Cortana_Backup md %userprofile%\Cortana_Backup
if exist %userprofile%\Cortana_Backup echo Directorio %userprofile%\Cortana_Backup creado. > %temp%\cortana2ana.log

if exist "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" echo Detectada configuracion realizada, saltando...
if exist "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" goto backupreg

echo.
echo Cogiendo propiedad de tokens_TTS_es-ES.xml...
takeown /F "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /A >> %temp%\cortana2ana.log

echo.
echo Dando permisos administrador a tokens_TTS_es-ES.xml...
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /grant Administradores:f >> %temp%\cortana2ana.log

echo.
echo Creando copia de seguridad de tokens_TTS_es-ES.xml...
copy /Y "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" >> %temp%\cortana2ana.log

echo.
echo Editando tokens_TTS_es-ES.xml...
findstr /v "</Tokens>" "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" > "%temp%\tokens_TTS_es-ES.xml"

echo ^<Category name="Voices" categoryBase="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore"^> > "%temp%\Ana-token.txt"
echo    ^<Token name="MSTTS_V110_esES_Ana"^> >> "%temp%\Ana-token.txt"
echo       ^<String name="" value="Microsoft Ana - Spanish (Spain)" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="LangDataPath" value="%windir%\Speech_OneCore\Engines\TTS\es-ES\MSTTSLocesES.dat" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="VoicePath" value="%windir%\Speech_OneCore\Engines\TTS\es-ES\M3082Ana" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="409" value="Microsoft Ana - Spanish (Spain)" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="CLSID" value="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Version" value="11.0" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Language" value="C0A" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Gender" value="Female" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Age" value="Adult" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="DataVersion" value="11.0.2013.1022" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="SharedPronunciation" value="" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Name" value="Microsoft Ana" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="Vendor" value="Microsoft" /^> >> "%temp%\Ana-token.txt"
echo       ^<Attribute name="SampleText" value="Has seleccionado %%1 como voz predeterminada." /^> >> "%temp%\Ana-token.txt"
echo    ^</Token^> >> "%temp%\Ana-token.txt"
echo  ^</Category^> >> "%temp%\Ana-token.txt"
echo ^</Tokens^> >> "%temp%\Ana-token.txt"

type "%temp%\Ana-token.txt" >> "%temp%\tokens_TTS_es-ES.xml"
type "%temp%\tokens_TTS_es-ES.xml" > "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml"

echo.
echo Devolviendo permisos de TrustedInstaller a tokens_TTS_es-ES.xml...
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /setowner "NT SERVICE\TrustedInstaller" >> %temp%\cortana2ana.log

echo.
echo Restaurando permisos de tokens_TTS_es-ES.xml...
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /reset >> %temp%\cortana2ana.log

:backupreg
echo.
if exist "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg" echo Detectado backup de registro realizado, saltando...
if exist "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg" goto anareg

echo.
echo Creando backup de claves de registro...
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg"
reg export HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated "%userprofile%\Cortana_Backup\hkey-user-s-m-speech_onecore-isolated.reg"
echo Backup de claves creadas  >> %temp%\cortana2ana.log

:anareg
echo.
echo Modificando claves de registro...
regedit /s %temp%\1-Voice-Ana-Cortana.reg
echo Generadas claves de registro usando %temp%\1-Voice-Ana-Cortana.reg >> %temp%\cortana2ana.log

echo.
echo Extrayendo claves Isolated...
reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated > "%temp%\isolated.txt"
echo Claves Isolated generadas:  >> %temp%\cortana2ana.log
type %temp%\isolated.txt  >> %temp%\cortana2ana.log

echo Primera parte finalizada.
echo  Primera parte finalizada. >> %temp%\cortana2ana.log
pause

:isolated1
echo.
cls
for /F "tokens=1,2,3,4,5,6 delims=\" %%a in (%temp%\isolated.txt) do @echo %%f

echo.
echo De la lista de arriba, copia los codigos uno a uno,
SET /P isolated1=y pega el primero aqui: || Set isolated1=ninguno
If "%isolated1%"=="ninguno" goto error1

goto continuar1

:error1
echo.
echo No has puesto ningun codigo!
echo Pulsa una tecla para intentar de nuevo...
echo Error de usuario >> %temp%\cortana2ana.log
pause > nul

cls
goto isolated1

:continuar1
echo Windows Registry Editor Version 5.00 > %temp%\isolated1.reg
echo. >> %temp%\isolated1.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated\%isolated1%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana] >> %temp%\isolated1.reg
echo @="Microsoft Ana - Spanish (Spain)" >> %temp%\isolated1.reg
echo "LangDataPath"="%%windir%%\\Speech_OneCore\\Engines\\TTS\\es-ES\\MSTTSLocesES.dat" >> %temp%\isolated1.reg
echo "VoicePath"="%%windir%%\\Speech_OneCore\\Engines\\TTS\\es-ES\\M3082Ana" >> %temp%\isolated1.reg
echo "409"="Microsoft Ana - Spanish (Spain)" >> %temp%\isolated1.reg
echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}" >> %temp%\isolated1.reg
echo. >> %temp%\isolated1.reg
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated\%isolated1%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes] >> %temp%\isolated1.reg
echo "Version"="11.0" >> %temp%\isolated1.reg
echo "Language"="C0A" >> %temp%\isolated1.reg
echo "Gender"="Female" >> %temp%\isolated1.reg
echo "Age"="Adult" >> %temp%\isolated1.reg
echo "DataVersion"="11.0.2013.1022" >> %temp%\isolated1.reg
echo "SharedPronunciation"="" >> %temp%\isolated1.reg
echo "Name"="Microsoft Ana" >> %temp%\isolated1.reg
echo "Vendor"="Microsoft" >> %temp%\isolated1.reg
echo "SampleText"="Has seleccionado %%1 como voz predeterminada." >> %temp%\isolated1.reg

echo.
regedit /s %temp%\isolated1.reg
echo clave de registro modificada con isolated %isolated1%
echo clave de registro modificada con isolated %isolated1% >> %temp%\cortana2ana.log

:isolated2
echo.
SET /p mas=Tienes mas claves para meter? (S/N): 
if %mas%== S goto continuar2
if %mas%== s goto continuar2
if %mas%== si goto continuar2
if %mas%== N goto fin
if %mas%== n goto fin
if %mas%== no goto fin

:error2
echo.
echo No has contestado correctamente!
echo Pulsa una tecla para intentar de nuevo...
echo Error de usuario >> %temp%\cortana2ana.log
pause > nul
goto isolated2

:continuar2
cls
for /F "tokens=1,2,3,4,5,6 delims=\" %%a in (%temp%\isolated.txt) do @echo %%f
SET /P isolated1=sigue la copia por el siguiente codigo que toca: || Set isolated1=ninguno
if "%isolated1%"=="ninguno" goto :error3
goto continuar1

:error3
echo No has puesto ningun codigo!
echo Pulsa una tecla para intentar de nuevo...
echo Error de usuario >> %temp%\cortana2ana.log
pause > nul

goto continuar2

:fin
regedit /s %temp%\1-Voice-Ana-Cortana.reg
echo Generadas de nuevo claves de registro usando %temp%\1-Voice-Ana-Cortana.reg >> %temp%\cortana2ana.log
echo.
echo Activando todas las voces disponibles en el sistema (las mobile tambien!)
Powershell.exe -executionpolicy remotesigned -File .\enable_all_voices.ps1


cls
echo.
echo Con esto deberia bastar.
echo.
echo Puedes comprobar si ha funcionado mediante el siguiente menu de Windows 10:
echo Configuracion -- hora e idioma -- voz
echo.
echo Y en:
echo Panel de Control - Accesibilidad - Texto a voz.
echo.
echo Deberia aparecer una nueva voz llamada "Microsoft Ana"
echo Si no aparece, puede que tengas que reintentarlo de nuevo. A veces es necesario
echo para dar con el codigo "isolated" correcto.
echo.
echo En caso de reintentarlo y no funcionar ejecuta:
echo            %temp%\1-Voice-Ana-Cortana.reg
echo.
echo Cualquier duda puedes dirigirte al foro oficial de Frontier o al Telegram @EliteEsp
echo.
echo Si quieres ver el log pulsa una tecla, si no, puedes cerrar esta ventana.
echo.
echo Fly safe cmdr. o7
pause > nul
echo Generando log en %temp%\cortana2ana.log...
type  %temp%\cortana2ana.log
echo.
echo Pulse una tecla para cerrar.
pause > nul
exit
