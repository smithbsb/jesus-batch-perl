package JesusDAO;

use strict;
use warnings;
use POSIX qw(strftime);
use LWP::UserAgent;
use feature 'say';


sub recoveryIpValid {
    my $user_agent = LWP::UserAgent->new;
    my $http_response = $user_agent->get('https://meuip.com.br');
    my $body = $http_response->decoded_content;
    my @ar_body = ();
    @ar_body = split('Meu ip', $body);
    @ar_body = split('</h3>', $ar_body[2]);
    @ar_body = split(' ', $ar_body[0]);
    return $ar_body[1];
}

sub saveIpInConfigFile {
    my ($v_path, $v_ip) = @_;
    my $file_ip = $v_path."/conf/ip.conf";
    open(my $fh, ">", $file_ip) or die "Erro ao criar arquivo de ip.";
    print $fh $v_ip;
    close $fh;
}

sub recoveryIpFromConfigFile {
    my ($v_path) = @_;
    my $file_ip = $v_path."/conf/ip.conf";
    open my $fh, '<', $file_ip;
    read $fh, my $string, -s $fh;
    close $fh;
    chomp $string;
    return $string;
}

sub saveIpInWeb {
    my ($v_ip) = @_;
    my $user_agent = LWP::UserAgent->new;
    my $http_response = $user_agent->get("http://smithsoftwares.com/jesus/saveIp.php?id=13245678&ip=$v_ip");
    my $body = $http_response->decoded_content;
}

1;

