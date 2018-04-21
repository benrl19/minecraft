#!/usr/bin/python3
import subprocess

folder = []

with open('fileoutput.txt') as file:
    for line in file:
        if line[:4] == ' [D]':
            date = line.replace(' [D]  ','')
            date = date.replace('\n','')
            folder.append(date)
            
folder.sort(key=int)
keepers = folder[-5:]
print(keepers)
goners = list(set(folder) - set(keepers))
print(goners)

for i in goners:
    subprocess.call(['/var/backup_minecraft/dropbox_uploader.sh','delete',i])
