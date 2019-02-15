# Cortana-2-Ana
### Enable Cortana to Text-to-Speech (TTS) for 3rd parties.
Only for WINDOWS 10 x64 and Spanish language (at the moment)

Con la intención de añadir una voz de gran calidad al ordenador de abordo de mi nave de Elite: Dangerous, aprovechando las bondades de VoiceAttack, EDDI, y EDengineer para la utilización del motor TTS de Windows 10, he realizado un script en batch empaquetado en 7z autoejecutable para activar a Cortana para su uso en programas de terceros y en el apartado "texto a voz" de Windows 10 (tanto en la configuración "metro" como en la del Panel de control antíguo). Cortana en realidad es "Microsoft Ana".

¡AVISO! Aunque hay abierta una petición en Windows Insider, Microsoft ha comunicado que no añadirán a Cortana para su uso de terceros para no ayudar a software malintencionado a confundir al usuario con "la voz del sistema". QUEDA BAJO VUESTRA RESPONSABILIDAD EL USO DE ESTE SCRIPT Y ME DESENTIENDO DE CUALQUIER RESPONSABILIDAD POR CUALQUIER PROBLEMA QUE PUEDA CAUSAR.

## DESCARGA:

[https://github.com/hoksilato2/Cortana-2-Ana/releases](https://github.com/hoksilato2/Cortana-2-Ana/releases)


## INSTRUCCIONES:

1- Ejecutar cortana-2-ana.exe con permisos Administrador

2- seguir indicaciones de pantalla


## REFERENCIAS:

Para realizar este script me he basado en el siguiente post de [superusers.com](https://superuser.com/questions/1141840/how-to-enable-microsoft-eva-cortanas-voice-on-windows-10)

No se ha compilado el exe en ningun otro código. Es un script batch empaquetado en un autoejecutable 7zip.


## BUGS Y SOLUCIÓN DE INCIDENCIAS:

Aunque no debería hacer falta reiniciar el equipo, es recomendable después de la instalación.

Si podéis observar a Microsoft Ana en la lista de voces disponibles mediante la Configuración metro del sistema pero no mediante la de Panel de Control intentar ejecutar el archivo de registro que se habrá creado en la siguiente ubicación:

      %temp%\1-Voice-Ana-Cortana.reg
      
      
      
De momento no se han encontrado mas bugs.


## AGRADECIMIENTOS:

- Mis primeras víctimas de testeo Zelvin y Txus de la comunidad Spanish Pilots Society (SPS) de Elite: Dangerous.
- Altair28 del foro oficial de Frontier que a estas alturas aun no tiene ni idea que gracias a su gran trabajo configurando un perfil de VoiceAttack ha ayudado a motivarme para este pequeño proyecto.

- Agradecer a cualquiera que quiera aportar algo!
