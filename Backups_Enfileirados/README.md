Script para verificar enfileiramento no BACULA

1)	Copiar esses dois scripts "bacula_backups_enfileirados.sh" e
	"bacula_gera_log_bconsole.sh" no diretorio /etc/zabbix/, renomeando 
	para tirar o "bacula_" do inicio e transforma-los em executavel (chmod
	+x).
	A forma mais facil e rapida de baixa-los (todo o necessario) eh a
	seguinte:

	wget zabbix.netmaker.com.br/utils/bacula_Instrucoes.txt
	wget zabbix.netmaker.com.br/utils/bacula_backups_enfileirados.sh
	wget zabbix.netmaker.com.br/utils/bacula_gera_log_bconsole.sh



2)	Colocar os dois Userparameters no zabbix_agentd.conf abaixo:

	UserParameter=Gera_log_Bacula,/etc/zabbix/bacula_gera_log_bconsole.sh
	UserParameter=Backups_enfileirados,/etc/zabbix/bacula_backups_enfileirados.sh


3)	Criar um agendamento no crontab para gerar o log como modelo abaixo,
	mudando o tempo como quiser. Nesse exemplo ele eh gerado de 6 em 6 minutos
	
	*/6 * * * * /bin/bash /etc/zabbix/gera_log_bconsole.sh


4)	Agora eh so criar um item com chave "Backups_enfileirados" no bacula com
	o tipo "Numerico (inteiro)" e criar as devidas triggers.
