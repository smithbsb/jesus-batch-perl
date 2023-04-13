#!/usr/bin/perl
# jesus.main.pl
#
#
# Monitorar troca de ip dinamico 
# e enviar para o site.
#
#  Empresa: Smith Softwares
#  WebSite: smithsoftwares.com
#    Autor: Cesar Smith
#     Data: 2023-03-28
#
use strict;
use warnings;
use POSIX qw(strftime);
use LWP::UserAgent;
use feature 'say';

my $v_path;
BEGIN { $v_path = $ARGV[0]; }
use lib "$v_path/source/dao";
use lib "$v_path/source/util";
use JesusDAO;
use LogUtil;


#
# Recupera Ip Valido pelo site meuip.com
#
LogUtil::writeLog($v_path, "Iniciando...");
LogUtil::writeLog($v_path, "Recuperando IP da Internet...");
my $ip_http = JesusDAO::recoveryIpValid();
LogUtil::writeLog($v_path, "Ip encontrado => $ip_http");

#
# Recupera Ip salvo no arquivo de configuracao
#
LogUtil::writeLog($v_path, "Recuperando IP do arquivo de configuracao...");
my $ip_file = JesusDAO::recoveryIpFromConfigFile($v_path);
LogUtil::writeLog($v_path, "Ip encontrado => $ip_file");

#
# Verifica se sao diferentes e atualiza
#
if ($ip_file ne $ip_http) {
    JesusDAO::saveIpInConfigFile($v_path, $ip_http);
    LogUtil::writeLog($v_path, "Ip $ip_http atualizado no arquivo de configuracao.");
    JesusDAO::saveIpInWeb($ip_http);
} else {
    LogUtil::writeLog($v_path, "Ip ja esta atualizado!");
}

LogUtil::writeLog($v_path, "Finalizado.\n");

