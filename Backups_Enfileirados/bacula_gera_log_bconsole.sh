# Zera o antigo arquivo de LOG e gera um novo da saida do "s dir" do bconsole" para futura consulta

#!/bin/bash
>/etc/zabbix/logbconsole
/sbin/bconsole <<eof 
@output /etc/zabbix/logbconsole
status dir
@output
eof
