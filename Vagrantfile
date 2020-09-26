# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  config.vm.hostname = "zabbix-vagrant"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  	vb.name = "zabbix-vagrant"
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
  	sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
  	#Atualização
	sudo yum update -y
	#Instalação dos pacotes
	sudo yum install httpd -y
	sudo yum install mariadb-server -y
	sudo systemctl enable httpd && sudo systemctl start httpd
	sudo systemctl enable mariadb && sudo systemctl start mariadb
	#Instalação do repositorio
	sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-2.el7.noarch.rpm
  	#Instalação do Zabbix
	sudo yum install zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-get zabbix-sender zabbix-java-gateway -y
	#Configurações do Apache (Time Zone)
	sudo sed 's@# php_value date.timezone Europe/Riga@php_value date.timezone America/Fortaleza@' -i /etc/httpd/conf.d/zabbix.conf
	#Configuração do banco de dados
	sudo mysql -e "create database zabbix character set utf8 collate utf8_bin;"
	sudo mysql -e "create user zabbix@localhost identified by 'zabbix';"
	sudo mysql -e "grant all privileges on zabbix.* to zabbix@localhost;"
	sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p"zabbix" zabbix
	#Configuração do usuário zabbix
	sudo sed 's/# DBPassword=/DBPassword=zabbix/g' -i /etc/zabbix/zabbix_server.conf
	sudo sed 's/# DBUser=/DBPassword=zabbix/g' -i /etc/zabbix/zabbix_server.conf
	#Habilitando a inicialização e reiniciando os serviços
	sudo systemctl enable zabbix-server zabbix-agent httpd
	sudo systemctl restart zabbix-server zabbix-agent httpd
  SHELL
end
