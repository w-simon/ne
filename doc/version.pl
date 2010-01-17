#!/usr/bin/perl -w

# Usage: $0 VERSION=XXXXX

use strict;
$| = 1;             

if ( $ARGV[0] !~ m/^VERSION=(.+)/ )
  {
    print "$0: no version specified; leaving version.texinfo alone.\n";
    exit 0;
  }
my $version = $1;
my $year  = 1900 + (localtime(time()))[5];
my $month = substr("00" . (1+(localtime(time()))[4]), -2);
my $date  = substr("00" . (  (localtime(time()))[3]), -2);

open  NE_VERSION_TEXINFO, ">version.texinfo" or die;
print NE_VERSION_TEXINFO qq[
\@set VERSION $version
\@set RELEASE_YEAR $year
\@set RELEASE_MONTH $month
\@set RELEASE_DATE $date
\@set DATE (\@value{RELEASE_DATE}.\@value{RELEASE_MONTH}.\@value{RELEASE_YEAR})
\@set PROGRAM_NAME ne, the nice editor
\@set ABOUT_MSG \@value{PROGRAM_NAME} \@value{VERSION}. \@value{DATE}
];
close NE_VERSION_TEXINFO;

