execute "apt-get update" do
    command "apt-get update"
end

package "openjdk-9-jre-headless" do
    action :install
end

user 'minecraft' do
 system true
 shell '/bin/nologin'
 action :create           
end

directory '/var/minecraft' do
 owner 'minecraft'
 group 'minecraft'
 mode '0775'
 action :create
end

cookbook_file "/var/minecraft/eula.txt" do
    source "eula.txt"
    owner 'minecraft'
    group 'minecraft'
    mode "0644"
    action :create
end

cookbook_file "/var/minecraft/server.properties" do
    source "server.properties"
    owner 'minecraft'
    group 'minecraft'
    mode "0644"
    action :create
end

cookbook_file "/var/minecraft/ops.txt" do
   source "admin.txt"
   owner 'minecraft'
   group 'minecraft'
   mode "0644"
   action :create
end

remote_file  "/var/minecraft/minecraft_server.1.14.4.jar" do
    source "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar"
    owner 'minecraft'
    group 'minecraft'
    mode '0775'
    action :create
end

cookbook_file "/lib/systemd/system/minecraft.service" do
    source "minecraftservice"
    owner 'root'
    group 'root'
    mode "0755"
    action :create
end

service "minecraft" do
    action [:start, :enable, :restart]
end
