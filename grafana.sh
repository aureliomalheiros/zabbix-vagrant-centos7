#!/bin/bash

echo "[TASK 01] Download dos pacotes essenciais"

sudo yum install initscripts urw-fonts wget > /dev/null 2>&1

echo "[TASK 01] Baixando o grafana"

sudo wget https://dl.grafana.com/oss/release/grafana-7.3.4-1.x86_64.rpm

echo "[TASK 02] Instalando grafana"

sudo rpm -Uvh grafana-7.3.4-1.x86_64.rpm > /dev/null 2>&1

echo "[TASK 03] Reiniciando o daemon"

sudo systemctl daemon-reload

echo "[TASK 04] Inicializando o grafana-server"

sudo systemctl start grafana-server

echo "[TASK 05] Habilitando a inicialização do Grafana junto ao Centos"

sudo systemctl enable grafana-server
