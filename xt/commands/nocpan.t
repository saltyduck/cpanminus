use strict;
use Test::More;
use xt::Run;

my $local_lib = "$ENV{PERL_CPANM_HOME}/perl5";

delete $ENV{$_} for qw(PERL5LIB PERL_MM_OPT MODULEBUILDRC);
$ENV{PERL5LIB} = 'fatlib';

my @opt = ("-L", $local_lib,
           '--local-metadb=testdist',
           '--reinstall', '--nocpan');

run @opt, "LocalModule2";
like last_build_log, qr/FAIL Couldn't find module or a distribution LocalModule2/;

done_testing;
