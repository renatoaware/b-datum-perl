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

my $res = $node->info(
    key => '/frutas.txt'
);

is($res->{name}, 'frutas.txt', 'name ok');
ok($res->{etag}, 'etag ok');
ok($res->{version}, 'version ok');
ok($res->{size}, 'size ok');
ok($res->{content_type}, 'content_type ok');


$res = $node->info(
    key => '/frutas404.txt'
);
is($res->{error}, 404, '404 erro');

$res = $node->info(
    key => '/'
);
is($res->{error}, 404, '404 erro');

done_testing();
