use strict;
use warnings;
use Test::More;

use FindBin qw($Bin);

BEGIN {
    use_ok('BDatum::Simple::API::Node');
}

my $node = BDatum::Simple::API::Node->new(
    partner_key => 'ys9hzza605zZVKNJvdiB',
    node_key    => 'ALThcI8EWJOPHeoP01mz'
);

my $res = $node->send(
    file => $Bin . '/../etc/frutas.txt',
    path => '/'
);
use DDP;
 p $res;


done_testing();
