#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;

my $schema_file = '../xsd/recipe.xsd';
my $document    = '../napoleon/recipe.xml';

my $schema = XML::LibXML::Schema->new(location => $schema_file);

my $parser = XML::LibXML->new;
my $doc    = $parser->parse_file($document);

eval { $schema->validate($doc) };
die $@ if $@;

print "$document validated successfully\n";

