package Validator::Custom::Trim::Constraints;

use strict;
use warnings;

sub trim {
    my $value = shift;
    $value =~ s/^\s*(.*?)\s*$/$1/ms;
    return [1, $value];
}

sub trim_lead {
    my $value = shift;
    $value =~ s/^\s+(.*)$/$1/ms;
    return [1, $value];
}

sub trim_trail{
    my $value = shift;
    $value =~ s/^(.*?)\s+$/$1/ms;
    return [1, $value];
}

sub trim_collapse {
    my $value = shift;
    if (defined $value) {
        $value =~ s/\s+/ /g;
        $value =~ s/^\s*(.*?)\s*$/$1/ms;
    }
    return [1, $value];
}

=head1 NAME

Validator::Custom::Trim - Space triming;

=head1 CONSTRAINTS

Constraints functions is explained in L<Validator::Custom::Trim>

=head2 trim

=head2 trim_lead

=head2 trim_trail

=head2 trim_collapse

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut


1;
