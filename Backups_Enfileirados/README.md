Script para verificacao de enfileiramento de JOBS no BACULA pelo ZABBIX:

1)	Copiar os dois scripts "bacula_backups_enfileirados.sh" e
	"bacula_gera_log_bconsole.sh" para o diretorio /etc/zabbix/ e
	transforma-los em executavel (chmod +x).

	wget zabbix.netmaker.com.br/utils/bacula_backups_enfileirados.sh
	wget zabbix.netmaker.com.br/utils/bacula_gera_log_bconsole.sh

2)	Colocar os dois Userparameters abaixo no zabbix_agentd.conf:

	UserParameter=Gera_log_Bacula,/etc/zabbix/bacula_gera_log_bconsole.sh
	UserParameter=Backups_enfileirados,/etc/zabbix/bacula_backups_enfileirados.sh

3)	Criar um agendamento no crontab para gerar o log como modelo abaixo,
	alterando o tempo como quiser. Nesse exemplo ele eh gerado de 6 em 6 minutos.
	
	*/6 * * * * /bin/bash /etc/zabbix/bacula_gera_log_bconsole.sh

4)	Feito isso, eh so criar um item com a chave "Backups_enfileirados" no ZABBIX com
	o tipo "Numerico (inteiro)" e criar as devidas triggers.
