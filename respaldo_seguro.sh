#!/bin/bash

# --- Configuración ---
FECHA=$(date +%Y%m%d_%H%M)
ORIGEN="/mnt/disco_compartido/datos_confidenciales"
DESTINO="/mnt/disco_compartido/respaldos"
LOG="/var/log/respaldos_red.log"

# --- Proceso ---
echo "Inicio de respaldo: $FECHA " >> $LOG

# Crear carpeta de destino si no existe
mkdir -p $DESTINO

# Comprimir los datos (Punto clave de administración de archivos)
tar -czf $DESTINO/backup_$FECHA.tar.gz $ORIGEN 2>> $LOG

# Verificar si el comando anterior fue exitoso
if [ $? -eq 0 ]; then
    echo "[$FECHA] Respaldo creado correctamente." >> $LOG
else
    echo "[$FECHA] alló la creación del respaldo." >> $LOG
fi

echo "Fin del proceso" >> $LOG
