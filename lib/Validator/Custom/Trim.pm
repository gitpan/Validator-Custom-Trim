package Validator::Custom::Trim;

use warnings;
use strict;

use base 'Validator::Custom';

use Validator::Custom::Trim::Constraints;

__PACKAGE__->register_constraint(
    trim          => \&Validator::Custom::Trim::Constraints::trim,
    trim_lead     => \&Validator::Custom::Trim::Constraints::trim_lead,
    trim_trail    => \&Validator::Custom::Trim::Constraints::trim_trail,
    trim_collapse => \&Validator::Custom::Trim::Constraints::trim_collapse
);

1;

=head1 NAME

Validator::Custom::Trim - (Deprecated) Space triming;

=cut

our $VERSION = '0.0506';

=head1 CAUTHION

B<This module is deprecated. constraints of this module moved to >
L<Validator::Custom>.

=head1 SYNOPSIS

    use Validator::Custom::Trim;
    
    my $data = {
        key1  => ' 123 ',
        key2  => "  \n a \r\n b\nc  \t",
        key3  => '  abc  ',
        key4  => '  def  '
    };

    my $rule = [
      key1 => [
          ['trim']           # ' 123 ' -> '123'
      ],
      key2  => [
          ['trim_collapse']  # "  \n a \r\n b\nc  \t" -> 'a b c'
      ],
      key3      => [
          ['trim_lead']      # '  abc  ' -> 'abc   '
      ],
      key4     => [
          ['trim_trail']     # '  def  ' -> '   def'
      ]
    ];
    
    my $vc = Validator::Custom::Trim->new;
    my $result = $vc->validate($data, $rule);
    my $trimed = $result->data->{'key1'};

=head1 DESCRIPTIONS

L<Validator::Custom::Trim> is space triming filter.
This class inherit all methods from L<Validator::Custom>.
If you know usage of This module, See L<Validator::Custom>
documentation.

=head1 METHODS

This module is subclass of L<Validator::Custom>.
All methods of L<Validator::Custom> is available.

=head1 CONSTRAINT FUNCTIONS

=head2 trim

trim leading and trailing white space

=head2 trim_lead

trim leading white space

=head2 trim_trail

trim trailing white space

=head2 trim_collapse

Trim leading and trailing white space, and collapse all whitespace characters into a single space.

=head2 STABILITY

L<Validator::Custom::HTMLForm> is stable.
The following constraint function keep backword compatible.

    # Constraint functions
    trim
    trim_lead
    trim_trail
    trim_collapse

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
