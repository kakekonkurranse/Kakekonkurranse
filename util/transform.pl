#! /usr/bin/perl

use XML::LibXSLT;

my $xslt       = XML::LibXSLT->new;

my $stylesheet = $xslt->parse_stylesheet_file("../napoleon/example.xsl");
my $results    = $stylesheet->transform_file("../napoleon/recipe.xml");

print $stylesheet->output_string($results);

