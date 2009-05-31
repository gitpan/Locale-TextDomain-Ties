#!perl

use strict;
use warnings;

our $VERSION = 0;

use Tie::Sub;
use Locale::TextDomain 1.18 qw(test ./LocaleData/);

## no critic (Ties)
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
## use critic (Ties)

local $ENV{LANGUAGE} = 'de_DE';

() = print <<"EOT";
01 $__{'text1 original'}
02 $__x{'text1 original'}
03 $__x{[ 'text2 original {text}', text => 'is good' ]}
04 $__n{[ 'text3 original singular', 'text3 original plural', 2 ]}
05 $__nx{[ 'text4 original {num} singular', 'text4 original {num} plural', 1, num => 1 ]}
06 $__xn{[ 'text4 original {num} singular', 'text4 original {num} plural', 2, num => 2 ]}
07 $__p{[ 'special', 'ctext1 original' ]}
08 $__px{[ 'special', 'ctext2 original {text}', text => 'is good' ]}
09 $__np{[ 'special', 'ctext3 original singular', 'ctext3 original plural', 2, ]}
10 $__npx{[ 'special', 'ctext4 original {num} singular', 'ctext4 original {num} plural', 2, num => 2 ]}
11 @{ $N__{'text1 original'} }
12 @{ $N__n{[ 'text3 original singular', 'text3 original plural', 2 ]} }
13 @{ $N__p{[ 'special', 'ctext1 original' ]} }
14 @{ $N__np{[ 'special', 'ctext3 original singular', 'ctext3 original plural', 2 ]} }
EOT

# $Id$