use v6;
use Test;

plan 2;

my $prog = './bin/txt2pdf';

lives-ok { $prog };

#my $args = '-p=14 -n';
my $args = '-n';
my $ifil = './t/data/ca-passwords.txt';

my $cmd = "$prog $args $ifil";
lives-ok { run $cmd.words };

# cleanup
my $ifil-a = './t/data/ca-passwords.txt.ps';
my $ifil-b = './t/data/ca-passwords.txt.pdf';
unlink $ifil-a if $ifil-a.IO.f; 
unlink $ifil-b if $ifil-b.IO.f; 
