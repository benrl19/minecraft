#!/bin/bash
while true
do
if [ ! -f /var/backup_minecraft/.dropbox_uploader ]
then
echo "Key file not found please create key file"
else
DATE=`date '+%Y%m%d%H%M'`
mkdir /var/backup_minecraft/$DATE
cp -r /var/minecraft/world /var/backup_minecraft/$DATE/
/var/backup_minecraft/dropbox_uploader.sh upload /var/backup_minecraft/$DATE /
rm -r /var/backup_minecraft/$DATE
fi
python3 /var/backup_minecraft/clean.py
sleep 86400
done