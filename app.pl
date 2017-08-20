use strict;
use warnings;
use utf8;
use Encode;
use Net::Twitter::Lite::WithAPIv1_1;
use YAML::Tiny;

my $data = YAML::Tiny->new;
$data = YAML::Tiny->read('./secret_key.yml');
my $key = $data->[0];

my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
  consumer_key        => $key->{'consumer_key'},
  consumer_secret     => $key->{'consumer_secret'},
  access_token        => $key->{'access_token'},
  access_token_secret => $key->{'access_token_secret'},
  legacy_lists_api    => 1,
  ssl                 => 1
);


eval {
  $nt->update('わふーaaa');
};
die $@ if $@;

exit;
