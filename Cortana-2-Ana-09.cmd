::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdDqDJHic8U4MBxVRaBaLKm6GIrof/eX+4f6UnmoUQMoqerP41aaaIe4SpxepVJgs6lRfj+YNGB5KdxOnIAY3pg4=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZkw0
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQITJwlATQqDcTn3J7sdiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHGL/1E5JBpAQ2Q=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdDqDJHic8U4MBxVRaBaLKm6GIrof/eX+4f6UnmoUQMoqerP41aaaIe4SpxepVJgs6llVit8NAhoVLF+KYA55+TYMs3yAVw==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0E
cls
echo --------------------------------
echo     Cortana disponible en TTS
echo 		by cmdr. Hoksilato
echo --------------------------------
echo.
echo.
echo.
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto getPrivileges ) else ( goto errorUAC )

:getPrivileges
SETLOCAL ENABLEDELAYEDEXPANSION

echo.
echo Activando voces adicionales de Windows 10...

:: ******** AV.ps1 ************

echo set-executionpolicy remotesigned>"%~dp0AV.ps1"
echo $sourcePath = 'HKLM:\software\Microsoft\Speech_OneCore\Voices\Tokens' #Where the OneCore voices live>>"%~dp0AV.ps1"
echo $destinationPath = 'HKLM:\SOFTWARE\Microsoft\Speech\Voices\Tokens' #For 64-bit apps>>"%~dp0AV.ps1"
echo.>>"%~dp0AV.ps1"
echo $destinationPath2 = 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens' #For 32-bit apps>>"%~dp0AV.ps1"
echo $listVoices = Get-ChildItem $sourcePath>>"%~dp0AV.ps1"
echo foreach($voice in $listVoices)>>"%~dp0AV.ps1"
echo {>>"%~dp0AV.ps1"
echo $source = $voice.PSPath #Get the path of this voices key>>"%~dp0AV.ps1"
echo copy -Path $source -Destination $destinationPath -Recurse>>"%~dp0AV.ps1"
echo copy -Path $source -Destination $destinationPath2 -Recurse>>"%~dp0AV.ps1"
echo }>>"%~dp0AV.ps1"

:: ******** 1-Voice-Ana-Cortana.reg *************

echo Windows Registry Editor Version 5.00>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg">>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\MSTTS_V110_esES_Ana]>>"%~dp01-Voice-Ana-Cortana.reg"
echo @="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg">>"%~dp01-Voice-Ana-Cortana.reg"
echo "C0A"="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}">>"%~dp01-Voice-Ana-Cortana.reg"
echo "LangDataPath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   65,00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,53,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   4c,00,6f,00,63,00,65,00,73,00,45,00,53,00,2e,00,64,00,61,00,74,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo "VoicePath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,65,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,33,00,30,00,38,00,32,00,41,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,6e,00,61,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes]>>"%~dp01-Voice-Ana-Cortana.reg"
echo "Age"="Adult">>"%~dp01-Voice-Ana-Cortana.reg"
echo "DataVersion"="11.0.2016.0129">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Gender"="Female">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Language"="C0A">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Name"="Microsoft Ana">>"%~dp01-Voice-Ana-Cortana.reg"
echo "SharedPronunciation"="">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Vendor"="Microsoft">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Version"="11.0">>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana]>>"%~dp01-Voice-Ana-Cortana.reg"
echo @="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "C0A"="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}">>"%~dp01-Voice-Ana-Cortana.reg"
echo "LangDataPath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   65,00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,53,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   4c,00,6f,00,63,00,65,00,73,00,45,00,53,00,2e,00,64,00,61,00,74,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo "VoicePath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,65,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,33,00,30,00,38,00,32,00,41,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,6e,00,61,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes]>>"%~dp01-Voice-Ana-Cortana.reg"
echo "Age"="Adult">>"%~dp01-Voice-Ana-Cortana.reg"
echo "DataVersion"="11.0.2016.0129">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Gender"="Female">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Language"="C0A">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Name"="Microsoft Ana">>"%~dp01-Voice-Ana-Cortana.reg"
echo "SharedPronunciation"="">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Vendor"="Microsoft">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Version"="11.0">>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens\MSTTS_V110_esES_Ana]>>"%~dp01-Voice-Ana-Cortana.reg"
echo @="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "C0A"="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}">>"%~dp01-Voice-Ana-Cortana.reg"
echo "LangDataPath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   65,00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,53,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   4c,00,6f,00,63,00,65,00,73,00,45,00,53,00,2e,00,64,00,61,00,74,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo "VoicePath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,65,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,33,00,30,00,38,00,32,00,41,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,6e,00,61,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes]>>"%~dp01-Voice-Ana-Cortana.reg"
echo "Age"="Adult">>"%~dp01-Voice-Ana-Cortana.reg"
echo "DataVersion"="11.0.2016.0129">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Gender"="Female">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Language"="C0A">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Name"="Microsoft Ana">>"%~dp01-Voice-Ana-Cortana.reg"
echo "SharedPronunciation"="">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Vendor"="Microsoft">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Version"="11.0">>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens\MSTTS_V110_esES_Ana]>>"%~dp01-Voice-Ana-Cortana.reg"
echo @="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "C0A"="Microsoft Ana - Spanish (Spain)">>"%~dp01-Voice-Ana-Cortana.reg"
echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}">>"%~dp01-Voice-Ana-Cortana.reg"
echo "LangDataPath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   65,00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,53,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   4c,00,6f,00,63,00,65,00,73,00,45,00,53,00,2e,00,64,00,61,00,74,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo "VoicePath"=hex(2):25,00,77,00,69,00,6e,00,64,00,69,00,72,00,25,00,5c,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   70,00,65,00,65,00,63,00,68,00,5f,00,4f,00,6e,00,65,00,43,00,6f,00,72,00,65,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,5c,00,45,00,6e,00,67,00,69,00,6e,00,65,00,73,00,5c,00,54,00,54,00,53,00,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   5c,00,65,00,73,00,2d,00,45,00,53,00,5c,00,4d,00,33,00,30,00,38,00,32,00,41,\>>"%~dp01-Voice-Ana-Cortana.reg"
echo   00,6e,00,61,00,00,00>>"%~dp01-Voice-Ana-Cortana.reg"
echo. >>"%~dp01-Voice-Ana-Cortana.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes]>>"%~dp01-Voice-Ana-Cortana.reg"
echo "Age"="Adult">>"%~dp01-Voice-Ana-Cortana.reg"
echo "DataVersion"="11.0.2016.0129">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Gender"="Female">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Language"="C0A">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Name"="Microsoft Ana">>"%~dp01-Voice-Ana-Cortana.reg"
echo "SharedPronunciation"="">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Vendor"="Microsoft">>"%~dp01-Voice-Ana-Cortana.reg"
echo "Version"="11.0">>"%~dp01-Voice-Ana-Cortana.reg"

:: *************************************

powershell Set-ExecutionPolicy Unrestricted
powershell -File "%~dp0AV.ps1"

if not exist "%userprofile%\Cortana_Backup" md "%userprofile%\Cortana_Backup"
if exist "%userprofile%\Cortana_Backup" echo Directorio %userprofile%\Cortana_Backup creado. > ""%temp%\cortana2ana.log""

if exist "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" echo Detectada configuracion realizada, saltando...
if exist "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" goto backupreg

echo.
echo Cogiendo propiedad de tokens_TTS_es-ES.xml...
takeown /F "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /A >> "%temp%\cortana2ana.log"

echo.
echo Dando permisos administrador a tokens_TTS_es-ES.xml...
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /grant Administradores:f >> "%temp%\cortana2ana.log"

echo.
echo Creando copia de seguridad de tokens_TTS_es-ES.xml...
copy /Y "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" "%userprofile%\Cortana_Backup\tokens_TTS_es-ES.xml" >> "%temp%\cortana2ana.log"

echo.
echo Editando tokens_TTS_es-ES.xml...
findstr /v "</Tokens>" "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" > "%temp%\tokens_TTS_es-ES.xml"

echo ^<Category name="Voices" categoryBase="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore"^> > "%temp%\Ana-token.txt"
echo    ^<Token name="MSTTS_V110_esES_Ana"^> >> "%temp%\Ana-token.txt"
echo       ^<String name="" value="Microsoft Ana - Spanish (Spain)" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="LangDataPath" value="%windir%\Speech_OneCore\Engines\TTS\es-ES\MSTTSLocesES.dat" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="VoicePath" value="%windir%\Speech_OneCore\Engines\TTS\es-ES\M3082Ana" /^> >> "%temp%\Ana-token.txt"
echo       ^<String name="C0A" value="Microsoft Ana - Spanish (Spain)" /^> >> "%temp%\Ana-token.txt"
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
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /setowner "NT SERVICE\TrustedInstaller" >> "%temp%\cortana2ana.log"

echo.
echo Restaurando permisos de tokens_TTS_es-ES.xml...
icacls "%windir%\SysWOW64\Speech_OneCore\common\es-ES\tokens_TTS_es-ES.xml" /reset >> "%temp%\cortana2ana.log"

:backupreg
echo.
if exist "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg" echo Detectado backup de registro realizado, saltando...
if exist "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg" goto anareg

echo.
echo Creando backup de claves de registro...
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens "%userprofile%\Cortana_Backup\hkey-local-s-m-speech-voices-tokens.reg"
reg export HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated "%userprofile%\Cortana_Backup\hkey-user-s-m-speech_onecore-isolated.reg"
echo Backup de claves creadas  >> "%temp%\cortana2ana.log"

:anareg
echo.
echo Modificando claves de registro...

set "SystemPath=%SystemRoot%\System32"
if exist "%SystemRoot%\Sysnative\cmd.exe" set "SystemPath=%SystemRoot%\Sysnative"

%SystemPath%\REG.EXE IMPORT ""%~dp01-Voice-Ana-Cortana.reg""
echo Generadas claves de registro usando "%~dp01-Voice-Ana-Cortana.reg" >> "%temp%\cortana2ana.log"

echo.
echo Extrayendo claves Isolated...
reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated> "%temp%\isolated.txt"
echo Claves Isolated generadas: >> "%temp%\cortana2ana.log"
type %temp%\isolated.txt>> "%temp%\cortana2ana.log"

:isolated1
echo.
cls
if exist ""%temp%\isolated.log"" del /Q ""%temp%\isolated.log""
for /F "tokens=1,2,3,4,5,6 delims=\" %%a in ("%temp%\isolated.txt") do ( 
	echo %%f>>"%temp%\isolated.log"
	echo %%f>"%temp%\isocode.log"
	set /p isocode=<"%temp%\isocode.log"
	echo Windows Registry Editor Version 5.00 > ""%temp%\isocode.reg""
	echo. >> "%temp%\isocode.reg"
	echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated\!isocode!\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana] >> "%temp%\isocode.reg"
	echo @="Microsoft Ana - Spanish (Spain)" >> "%temp%\isocode.reg"
	echo "LangDataPath"="%%windir%%\\Speech_OneCore\\Engines\\TTS\\es-ES\\MSTTSLocesES.dat" >> "%temp%\isocode.reg"
	echo "VoicePath"="%%windir%%\\Speech_OneCore\\Engines\\TTS\\es-ES\\M3082Ana" >> "%temp%\isocode.reg"
	echo "C0A"="Microsoft Ana - Spanish (Spain)" >> "%temp%\isocode.reg"
	echo "CLSID"="{179F3D56-1B0B-42B2-A962-59B7EF59FE1B}" >> "%temp%\isocode.reg"
	echo. >> "%temp%\isocode.reg"
	echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Isolated\!isocode!\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_esES_Ana\Attributes] >> "%temp%\isocode.reg"
	echo "Version"="11.0" >> "%temp%\isocode.reg"
	echo "Language"="C0A" >> "%temp%\isocode.reg"
	echo "Gender"="Female" >> "%temp%\isocode.reg"
	echo "Age"="Adult" >> "%temp%\isocode.reg"
	echo "DataVersion"="11.0.2013.1022" >> "%temp%\isocode.reg"
	echo "SharedPronunciation"="" >> "%temp%\isocode.reg"
	echo "Name"="Microsoft Ana" >> "%temp%\isocode.reg"
	echo "Vendor"="Microsoft" >> "%temp%\isocode.reg"
	echo "SampleText"="Has seleccionado %%1 como voz predeterminada." >> "%temp%\isocode.reg"
	
	regedit /s "%temp%\isocode.reg"
	echo clave de registro modificada con isolated !isocode!
	echo clave de registro modificada con isolated !isocode! >> "%temp%\cortana2ana.log"
)

echo.
echo Revisando voces...
powershell Set-ExecutionPolicy Unrestricted
powershell -File "%~dp0AV.ps1"

pause

:fin
rem regedit /s "%~dp01-Voice-Ana-Cortana.reg"
rem echo Generadas de nuevo claves de registro usando %temp%\1-Voice-Ana-Cortana.reg >> "%temp%\cortana2ana.log"
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
rem echo En caso de reintentarlo y no funcionar ejecuta:
rem echo            %temp%\1-Voice-Ana-Cortana.reg
rem echo.
echo Cualquier duda puedes dirigirte al foro oficial de Frontier o al Telegram @EliteEsp
echo.
echo Si quieres ver el log pulsa una tecla, si no, puedes cerrar esta ventana.
echo.
echo Fly safe cmdr. o7
pause > nul
echo Generando log en "%temp%\cortana2ana.log"...
type  "%temp%\cortana2ana.log"
echo.
echo Pulse una tecla para cerrar y limpiar temporales.
if exist "%~dp0AV.ps1" del /Q "%~dp0AV.ps1"
if exist "%~dp01-Voice-Ana-Cortana.reg" del /Q "%~dp01-Voice-Ana-Cortana.reg"
pause > nul
exit

:errorUAC
echo.
echo Es necesario abrir este script como administrador!
pause>nul
exit