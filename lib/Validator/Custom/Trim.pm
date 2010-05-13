package Validator::Custom::Trim;

use warnings;
use strict;

use base 'Validator::Custom';

__PACKAGE__->register_constraint(
    trim          => \&Validator::Custom::HTMLForm::Constraints::trim,
    trim_lead     => \&Validator::Custom::HTMLForm::Constraints::trim_lead,
    trim_trail    => \&Validator::Custom::HTMLForm::Constraints::trim_trail,
    trim_collapse => \&Validator::Custom::HTMLForm::Constraints::trim_collapse
);

package Validator::Custom::HTMLForm::Constraints;

use strict;
use warnings;

sub trim {
    my $value = shift;
    $value =~ s/^\s*(.*?)\s*$/$1/ms;
    return (1, $value);
}

sub trim_lead {
    my $value = shift;
    $value =~ s/^\s+(.*)$/$1/ms;
    return (1, $value);
}

sub trim_trail{
    my $value = shift;
    $value =~ s/^(.*?)\s+$/$1/ms;
    return (1, $value);
}

sub trim_collapse {
    my $value = shift;
    if (defined $value) {
        $value =~ s/\s+/ /g;
        $value =~ s/^\s*(.*?)\s*$/$1/ms;
    }
    return (1, $value);
}

package Validator::Custom::Trim;

1;

=head1 NAME

Validator::Custom::Trim - Space triming;

=head1 VERSION

Version 0.0502

=cut

our $VERSION = '0.0502';

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
    my $trimed = $result->products->{'key1'};

=head1 METHODS

This module is subclass of L<Validator::Custom>.
All methods of L<Validator::Custom> is available.

=head1 CONSTRAINTS

=head2 trim

trim leading and trailing white space

=head2 trim_lead

trim leading white space

=head2 trim_trail

trim trailing white space

=head2 trim_collapse

Trim leading and trailing white space, and collapse all whitespace characters into a single space.

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

=head1 SEE ALSO

L<Validator::Custom>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
