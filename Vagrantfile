Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "zabbix-vagrant"

  config.vm.network "private_network", ip: "172.10.10.10"
  config.vm.provider "virtualbox" do |vb|
  	vb.name = "zabbix-vagrant"
  end
  config.vm.provision "shell", inline: <<-SHELL
  	echo "INICIALIZANDO A INSTALAÇÃO DO AMBIENTE DE MONITORAMENTO"
  SHELL


  #Instalação Zabbix
  config.vm.provision "shell", path: "zabbix.sh"
  #Instalação Grafana
  config.vm.provision "shell", path: "grafana.sh"
end
