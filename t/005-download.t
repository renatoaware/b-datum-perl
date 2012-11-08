use strict;
use warnings;
use Test::More;
use utf8;

use FindBin qw($Bin);

BEGIN {
    use_ok('BDatum::Simple::API::Node');
}

my $node = BDatum::Simple::API::Node->new(
    partner_key => 'ys9hzza605zZVKNJvdiB',
    node_key    => 'ALThcI8EWJOPHeoP01mz'
);

my $res = $node->download(
    key => 'frutas.txt'
);

is($res->{name}, 'frutas.txt', 'name ok');
ok($res->{etag}, 'etag ok');
ok($res->{version}, 'version ok');
ok($res->{content_type}, 'content_type ok');
like($res->{content}, qr|banana|, 'content tem uma fruta!');


$res = $node->download(
    key => 'frutas.txt',
    file => $Bin . '/../etc/tmp_test.txt'
);

is($res->{name}, 'frutas.txt', 'name ok');
ok($res->{etag}, 'etag ok');
ok($res->{version}, 'version ok');
ok($res->{content_type}, 'content_type ok');
ok(!exists $res->{content}, 'content vazio!');
ok(-e $Bin . '/../etc/tmp_test.txt', 'arquivo existe!');

unlink($Bin . '/../etc/tmp_test.txt');



done_testing();
