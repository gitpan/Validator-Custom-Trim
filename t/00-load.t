#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Validator::Custom::Trim' );
}

diag( "Testing Validator::Custom::Trim $Validator::Custom::Trim::VERSION, Perl $], $^X" );
