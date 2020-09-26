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

* config.vm.network "public_network", ip: "seu_ip"

### Instalação do Zabbix

1ª Na primeira tela clique em **Next**

2ª Na segunda verifique se todos os pré-requisitos estão Ok, após isso clique em **Next**

3ª Na terceira tela é a configuração do banco
	
	**Database Type: MySQL**
	
	**Database Host: localhost**
	
	**Database Port: 3306**
	
	**Database Name: zabbix**
	
	**User: zabbix**
	
	**Password: zabbix**
	
Após digitar os dados clique em **Next**

4ª Na quarta tela são detalhes do servidor
	
	**Host: localhost**
	**Port: 10051**
	
	**Name: [Sua preferencia]**
	
5ª Na última tela são os detalhes da configuração, clique em **Next**.

6ª Última tela clique em **Finish**

#### Login

**User: Admin**

**Password: zabbix**
