Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "zabbix-vagrant"

  config.vm.network "private_network", ip: "172.10.10.10"
  config.vm.provider "virtualbox" do |vb|
  	vb.name = "zabbix-vagrant"
  end
  config.vm.provision "shell", inline: <<-SHELL
  	echo "INICIALIZANDO A INSTALAÇÃO DO ZABBIX"
  SHELL


  #Instalação Zabbix
  config.vm.provision "shell", path: "zabbix.sh"
  #Instalação Grafana
end
