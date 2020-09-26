# zabbix-vagrant-centos7
Levantar ambiente zabbix no Centos7
## Requisitos

* Virtual box
* Vagrant

### Instalação

	1. Faça o clone para sua máquina

	2. Na linha de comando digite

```console
host@host:~$ vagrant up && vagrant ssh
[vagrant@zabbix-vagrant ~]$ 
```
	3. Após finalizar a instalação digite o seguinte comando para pegar o IP do zabbix
```console 
host@host:~$ ip addr
```
	4. Digite no navegador
ip_do_server/zabbix

### Definindo IP estático

Para definir IP estático adicione na linha do Vagrantfile o seu IP

* ```console config.vm.network "public_network", ip: "seu_ip"```
