use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Validator::Custom::Trim',
    license             => 'perl',
    dist_author         => 'Yuki Kimoto <kimoto.yuki@gmail.com>',
    dist_version_from   => 'lib/Validator/Custom/Trim.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Validator::Custom' => 0.1002
    },
    add_to_cleanup      => [ 'Validator-Custom-Trim-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
