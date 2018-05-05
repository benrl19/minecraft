#!/usr/bin/python3
import subprocess

folder = []

files =  subprocess.Popen(['/var/backup_minecraft/dropbox_uploader.sh','list'],stdout=subprocess.PIPE)
outputbytes = files.stdout.read()
output = outputbytes.decode("utf-8")


for line in output.split("\n"):
    if line[:4] == ' [D]':
        date = line.replace(' [D]  ','')
        date = date.replace('\n','')
        folder.append(date)

folder.sort(key=int)
keepers = folder[-5:]
print("We are keeping: " + str(keepers))
goners = list(set(folder) - set(keepers))
print("We are deleting: " + str(goners))

for i in goners:
    subprocess.call(['/var/backup_minecraft/dropbox_uploader.sh','delete',i])