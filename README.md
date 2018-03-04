# minecraft

To install or apply updates
 
`sudo chef-solo -c solo.rb -j node.json`

`sudo systemctl restart minecraft`

To enable backups you have to provide a geneated auth key for Dropbox

To add the key
`sudo bash /var/backup_minecraft/dropbox_uploader.sh`

`sudo chown backup_minecraft:backup_minecraft /var/backup_minecraft/.dropbox_uploader`

`sudo systemctl restart backup_minecraft`

Backups are stored here every 5 hours
https://www.dropbox.com/sh/0sipgzt3snd5hfg/AADpT9_yINf4tkoXiY6FE94Ca?dl=0