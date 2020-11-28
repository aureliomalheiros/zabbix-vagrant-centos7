# zabbix-vagrant-centos7
## Descrição

Levantar ambiente de monitoramento utilizando Zabbix e Vagrant

## Requisitos

* Virtual box
* Vagrant

### Instalação

	1. Faça o clone para sua máquina

	2. Na linha de comando digite

```console
host@host:~$ vagrant up 
```

	3. Após finalizar a instalação acesse os dois servidores
**Zabbix**

	172.10.10.10/zabbix

**Grafana**

	172.10.10.10:3000

### Instalação do Zabbix

1ª Na primeira tela clique em **Next**

2ª Na segunda verifique se todos os pré-requisitos estão Ok, após isso clique em **Next**

3ª Na terceira tela é a configuração do banco
	
	Database Type: MySQL
	
	Database Host: localhost
	
	Database Port: 3306
	
	Database Name: zabbix
	
	User: zabbix
	
	Password: zabbix
	
Após digitar os dados clique em **Next**

4ª Na quarta tela são detalhes do servidor
	
	Host: localhost
	
	Port: 10051
	
	Name: [Sua preferencia]
	
5ª Na última tela são os detalhes da configuração, clique em **Next**.

6ª Última tela clique em **Finish**

#### Login

**User: Admin**

**Password: zabbix**

### Acesso ao Grafana

#### Login
**User: admin**
**Senha: admin**

### 🛠 Tecnologias

![VirtualBox](https://img.shields.io/badge/-VirtualBox-181717?style=for-the-badge&logo=virtualbox)
![Vagrant](https://img.shields.io/badge/-Vagrant-181717?style=for-the-badge&logo=vagrant)

### **:books: REFERÊNCIAS**

- [Documentação Vagrant](https://www.vagrantup.com/docs)
- [Documentação Grafana](https://grafana.com/docs/grafana/latest/installation/rpm/)
- [Documentação Zabbix](https://www.zabbix.com/documentation/4.0/manual/installation/install_from_packages/rhel_centos)

