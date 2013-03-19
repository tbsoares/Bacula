#Verifica o log e procura por jobs na listagem que nao estejam
#no estado "running" ou "canceled".
echo `grep 'Job\.' /etc/zabbix/logbconsole|grep -v running|grep -v canceled|wc -l`
