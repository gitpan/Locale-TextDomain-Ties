#!perl -T

use strict;
use warnings;

use Test::More tests => 16 + 1;
use Test::NoWarnings;
use Test::Deep;

BEGIN {
    use_ok('Tie::Sub');
    require_ok('Locale::TextDomain');
    Locale::TextDomain->import( qw(test ./example/LocaleData/) );
}

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

local $ENV{LANGUAGE} = 'de_DE';
my $translation;

$translation = $__{'text1 original'};
is(
    $translation,
    'text1 translated',
    '__',
);

$translation = $__x{'text1 original'};
is(
    $translation,
    'text1 translated',
    '__x',
);

$translation = $__x{[ 'text2 original {text}', text => 'is good' ]};
is(
    $translation,
    'text2 translated is good',
    '__x',
);

$translation = $__n{[ 'text3 original singular', 'text3 original plural', 2 ]};
is(
    $translation,
    'text3 translated plural',
    '__n'
);

$translation = $__nx{[ 'text4 original {num} singular', 'text4 original {num} plural', 1, num => 1 ]};
is(
    $translation,
    'text4 translated 1 singular',
    '__nx'
);

$translation = $__xn{[ 'text4 original {num} singular', 'text4 original {num} plural', 2, num => 2 ]};
is(
    $translation,
    'text4 translated 2 plural',
    '__xn'
);

$translation = $__p{[ 'special', 'ctext1 original' ]};
is(
    $translation,
    'ctext1 translated',
    '__p',
);

$translation = $__px{[ 'special', 'ctext2 original {text}', text => 'is good' ]};
is(
    $translation,
    'ctext2 translated is good',
    '__px'
);

$translation = $__np{[ 'special', 'ctext3 original singular', 'ctext3 original plural', 2 ]};
is(
    $translation,
    'ctext3 translated plural',
    '__np'
);

$translation = $__npx{[ 'special', 'ctext4 original {num} singular', 'ctext4 original {num} plural', 2, num => 2 ]};
is(
    $translation,
    'ctext4 translated 2 plural',
    '__npx'
);

$translation = $N__{'text1 original'};
is_deeply(
    $translation,
    ['text1 original'],
    'N__',
);

$translation = $N__n{[ 'text3 original singular', 'text3 original plural', 2 ]};
is_deeply(
    $translation,
    ['text3 original singular', 'text3 original plural', 2],
    'N__n'
);

$translation = $N__p{[ 'special', 'ctext1 original' ]};
is_deeply(
    $translation,
    ['special', 'ctext1 original'],
    'N__p',
);

$translation = $N__np{[ 'special', 'ctext3 original singular', 'ctext3 original plural', 2 ]};
is_deeply(
    $translation,
    ['special', 'ctext3 original singular', 'ctext3 original plural', 2],
    'N__np'
);