package LogUtil;

use strict;
use warnings;
use POSIX qw(strftime);


sub writeLog {
    my ($v_path, $v_msg) = @_;
    my $v_date = strftime "%Y_%m_%d", localtime;
    my $v_hour = strftime "%H:%M:%S", localtime;
    my $file_log = $v_path."/log/".$v_date.".log";
    open(my $fh, '>>', $file_log) or die "Erro ao criar arquivo de log.";
    print $fh $v_hour." - ".$v_msg."\n";
    close $fh;
}

1;

