package Validator::Custom::Trim;
use base 'Validator::Custom';

use warnings;
use strict;

our $VERSION = '0.0401';

__PACKAGE__->add_constraint(
    trim          => \&Validator::Custom::HTMLForm::Constraints::trim,
    trim_lead     => \&Validator::Custom::HTMLForm::Constraints::trim_lead,
    trim_trail    => \&Validator::Custom::HTMLForm::Constraints::trim_trail,
    trim_collapse => \&Validator::Custom::HTMLForm::Constraints::trim_collapse,
    
    # Provide FormValidator::Simple Compatiblity
    TRIM          => \&Validator::Custom::HTMLForm::Constraints::trim,
    TRIM_LEAD     => \&Validator::Custom::HTMLForm::Constraints::trim_lead,
    TRIM_TRAIL    => \&Validator::Custom::HTMLForm::Constraints::trim_trail,
    TRIM_COLLAPSE => \&Validator::Custom::HTMLForm::Constraints::trim_collapse
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

Validator::Custom::Trim - Triming based on Validator::Custom; 

=head1 VERSION

Version 0.0401

=cut

=head1 SYNOPSIS

    use Validator::Custom::Trim;
    
    my $data = {
        key1  => ' 123 ',
        key2  => "  \n a \r\n b\nc  \t",
        key3  => '  abc  ',
        key4  => '  def  '
    };

    my $validation_rule = [
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
    
    my $vc_trim = Validator::Custom::Trim->new;
    my $products = $vc_trim->validate($data, $validation_rule)->products;
    my $key1_product = $products->{key1};

=head1 DESCRIPTION

This module usage is same as L<Validator::Custom>.

See L<Validator::Custom> document.

=head1 CONSTRAINTS

The following is constraint functions

Upper case is also availabule, like TRIM

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

=head1 BUGS

Please report any bugs or feature requests to C<bug-validator-custom-trim at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Validator-Custom-Trim>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Validator::Custom::Trim


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Validator-Custom-Trim>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Validator-Custom-Trim>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Validator-Custom-Trim>

=item * Search CPAN

L<http://search.cpan.org/dist/Validator-Custom-Trim/>

=back


=head1 SEE ALSO

L<Validator::Custom>,

L<FormValidator::Simple>,L<FormValidator::Simple::Plugin::Trim>

L<Data::FormValidator>, L<Data::FormValidator::Filters>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Validator::Custom::Trim
