#!/bin/bash
#-------------------------------------------------------
# author:       Allan Souza <agsouza@unicamp.br>
# date:         12-out-2016
# Update Log:
# 20161012 - Inicio da criação do script de instalação do Grafana 
# 20161201 - Atualização do script para a instalação do Grafana 4.0
# UNICAMP-CCUEC-DPROD-OPER 2016 


############################################## INÍCIO DA  INSTALAÇÃO DO GRAFANA ##############################################
# Instalando o Grafana
yum install -y https://grafanarel.s3.amazonaws.com/builds/grafana-4.0.0-1480439068.x86_64.rpm

# Iniciando o serviço
service grafana-server start

# Configurando para que o Grafana se inicie no boot de inicialização
/sbin/chkconfig --add grafana-server

systemctl enable grafana-server

# Listando os plugins disponíveis para serem instalados no Grafana
grafana-cli plugins list-remote

# Instalando o plugin do Zabbix no Grafana
grafana-cli plugins install alexanderzobnin-zabbix-app

# Reiniciando o Grafana
service grafana-server restart
############################################## FIM DA  INSTALAÇÃO DO GRAFANA ##############################################
