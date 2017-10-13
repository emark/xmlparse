#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use XML::Simple qw(:strict);
use Data::Dumper;
use Encode;
use URI::Escape;

my $rss = XMLin(undef, KeyAttr => "channel", ForceArray => 0);
my $xml = XMLout($rss, NoEscape => 1, KeyAttr => "channel");

foreach my $key (@{$rss->{channel}->{item}}){
	#print $key->{'wp:post_id'}."\t";
	print Encode::decode('utf8',uri_unescape($key->{'link'}))."\n";
	#print $key->{'wp:attachment_url'}."\n";
	#print $key->{'wp:post_date'}."\n";
	#print $key->{'title'}."\n";
};

