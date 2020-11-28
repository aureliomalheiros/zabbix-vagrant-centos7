#!/bin/bash

echo "[TASK 01] Desabilitando Selinux"

sudo sed -i 's/^SELINUX=.*/SELINUX=disable/g' /etc/selinux/config
sudo setenforce 0

echo "[TASK 02] Atualização"

sudo yum update -y > /dev/null 2>&1

echo "[TASK 03 ]Instalação dos pacotes"

sudo yum install mariadb-server -y > /dev/null 2>&1
sudo systemctl enable mariadb && sudo systemctl start mariadb 2>&1

echo "[TASK 04] Instalação do repositorio do Zabbix"

sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-2.el7.noarch.rpm > /dev/null 2>&1

echo "[TASK 05] Instalação do Zabbix"

sudo yum install zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-get zabbix-sender zabbix-java-gateway -y > /dev/null 2>&1

echo "[TASK 06] Configurações do Apache (Time Zone)"

sudo sed 's@# php_value date.timezone Europe/Riga@php_value date.timezone America/Fortaleza@' -i /etc/httpd/conf.d/zabbix.conf 2>&1

echo "[TASK 07] Configuração do banco de dados"

sudo mysql -e "create database zabbix character set utf8 collate utf8_bin;"
sudo mysql -e "create user zabbix@localhost identified by 'zabbix';"
sudo mysql -e "grant all privileges on zabbix.* to zabbix@localhost;"
sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p"zabbix" zabbix

echo "[TASK 08] Configuração do usuário zabbix"

sudo sed 's/# DBPassword=/DBPassword=zabbix/g' -i /etc/zabbix/zabbix_server.conf
sudo sed 's/# DBUser=/DBPassword=zabbix/g' -i /etc/zabbix/zabbix_server.conf

echo "[TASK 09] Habilitando a inicialização e reiniciando os serviços"

sudo systemctl enable zabbix-server zabbix-agent httpd
sudo systemctl restart zabbix-server zabbix-agent httpd
