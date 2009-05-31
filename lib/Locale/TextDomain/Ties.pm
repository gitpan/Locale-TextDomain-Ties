package Locale::TextDomain::Ties;

use strict;
use warnings;

our $VERSION = '0.01';

# $Id$

1;

__END__

=pod

=head1 NAME

Locale::TextDomain::Ties - Tying translating subs to a hash

=head1 VERSION

0.01

=head1 SYNOPSIS

Tie what you want.
Here are all examples.

    use Tie::Sub;

    tie my %__x,   'Tie::Sub', sub { return __x(shift, @_) };
    tie my %__n,   'Tie::Sub', sub { return __n(shift, @_) };
    tie my %__nx,  'Tie::Sub', sub { return __nx(shift, @_) };
    tie my %__xn,  'Tie::Sub', sub { return __xn(shift, @_) };
    tie my %__p,   'Tie::Sub', sub { return __p(shift, shift) };
    tie my %__px,  'Tie::Sub', sub { return __px(shift, shift, @_) };
    tie my %__np,  'Tie::Sub', sub { return __np(shift, shift, @_) };
    tie my %__npx, 'Tie::Sub', sub { return __npx(shift, shift, @_) };
    tie my %N__,   'Tie::Sub', sub { return [N__(@_)] };
    tie my %N__n,  'Tie::Sub', sub { return [N__n(@_)] };
    tie my %N__p,  'Tie::Sub', sub { return [N__p(@_)] };
    tie my %N__np, 'Tie::Sub', sub { return [N__np(@_)] };
    use Locale::TextDomain::Ties;

%__ is already tied and exported by Locale::Text::Domain.
It is the same like:

    tie my %__, 'Tie::Sub', sub { return __(shift) };

=head1 EXAMPLE

Inside of this Distribution is a directory named example.
Run this *.pl files.

=head1 DESCRIPTION

Locale::TextDomain only ties a sub named &__
to a hash named %__ and a hash reference named $__ .

This module shows how to tie
all the other translating subs of Locale::TextDomain.

=head1 SUBROUTINES/METHODS

none

=head1 DIAGNOSTICS

none

=head1 CONFIGURATION AND ENVIRONMENT

nothing

=head1 DEPENDENCIES

none

=head1 INCOMPATIBILITIES

none

=head1 BUGS AND LIMITATIONS

not known

=head1 SEE ALSO

L<Locale::TextDomain> Localisation framework

L<Tie::Sub> The idea to use an arrayref as hash key too.

=head1 AUTHOR

Steffen Winkler

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009,
Steffen Winkler
C<< <steffenw at cpan.org> >>.
All rights reserved.

This module is free software;
you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut