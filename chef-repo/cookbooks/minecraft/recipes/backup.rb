user 'backup_minecraft' do
 system true
 shell '/bin/nologin'
 action :create           
end

directory '/var/backup_minecraft' do
 owner 'backup_minecraft'
 group 'backup_minecraft'
 mode '0770'
 action :create
end

cookbook_file "/var/backup_minecraft/dropbox_uploader.sh" do
    source "dropbox_uploader.sh"
    owner 'backup_minecraft'
    group 'backup_minecraft'
    mode "0550"
    action :create
end

cookbook_file "/var/backup_minecraft/backup.sh" do
    source "backup.sh"
    owner 'backup_minecraft'
    group 'backup_minecraft'
    mode "0550"
    action :create
end

cookbook_file "/lib/systemd/system/backup_minecraft.service" do
    source "backup_minecraftservice.txt"
    owner 'root'
    group 'root'
    mode "0755"
    action :create
end

service "backup_minecraft" do
    action [:start, :enable]
end