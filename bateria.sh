#!/bin/bash
#Script para avisar cuando la batería se está agotando
#O cuando está completamente llena
 
#Función para generar la fecha y hora
fyh() {
  date +"%Y-%m-%d %H:%M:%S"
}
 
#Exportación de variables. En este caso sirve para 
#que el cron sepa a donde direccionar la salida
#del programa. Cambiar clonbg
#por tu nombre de clonbg

#y 1000 por el id de tu clonbg
#. Para conocer el id de
#clonbg
#, usar el comando id en una terminal.
 
export XDG_RUNTIME_DIR="/run/clonbg/1000"
export DISPLAY=:0
export XAUTHORITY=/home/clonbg/.Xauthority
 
bateria=`/usr/bin/acpi -V | grep ', 15%'`;
 
 if [ -z "$bateria" ]
 then
  fyh;
  echo " Carga suficiente ..."
 else
  for contador in 1 2 3 4 5
  do
   /usr/bin/mplayer -display :0 -volume 50 /home/clonbg/Código/ScriptBateria/beep.wav
   sleep 1s
  done
 fi;
bateriacargada=`/usr/bin/acpi -V | grep ', 100%'`;
 if [ -z "$bateriacargada" ]
 then
  echo ""
 else
  for contador2 in 1 2 3 4 5
  do
   echo fyh;
   echo "Bateria totalmente cargada. Desenchufe cargador\n"
   /usr/bin/mplayer -display :0 -volume 50 /home/clonbg/Código/ScriptBateria/beep2.wav
   sleep 1s
  done
 fi;