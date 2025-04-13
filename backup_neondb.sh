#!/bin/bash

# Konfigurasjoner
DB_HOST="ep-black-mode-a2cqyx0a-pooler.eu-central-1.aws.neon.tech"
DB_PORT="5432"
DB_NAME="neondb"
DB_USER="neondb_owner"
BACKUP_PATH="/sdcard/neondb_backups/"
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)
BACKUP_FILE="${BACKUP_PATH}neondb_backup_${DATE}.sql"

# Opprett backup-mappen hvis den ikke finnes
mkdir -p $BACKUP_PATH

# Ta backup
pg_dump -h $DB_HOST -U $DB_USER -d $DB_NAME -p $DB_PORT -F c -b -v -f $BACKUP_FILE

# Sjekk om backup ble vellykket
if [ $? -eq 0 ]; then
    echo "Backup fullført: $BACKUP_FILE"
else
    echo "Backup feilet."
fi
