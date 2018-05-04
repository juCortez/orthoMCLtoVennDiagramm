#!/usr/bin/perl


#Este script usa um arquivo lista ordenada como referencia para extrair a seguencia completa de um outro arquivo prank fasta
 
use strict;
use warnings;
use autodie; # die if problem reading or writing a file
use Statistics::R;

my @list=("Serg","Tbru","Lmajor");
my $R = Statistics::R->new();
$R->send("library(VennDiagramm);");
foreach my $i (@list){
my @entries;
open FILE1, $ARGV[0] or die $!; #lista
open FILE2, $ARGV[1] or die $!; #prank fasta file
while(<FILE1>){
        my @prefix = split(":",$_);
        push @entries, $prefix[0] if /\b$i\b/
        ##if (/\b$i\b/){print $prefix[0],"\n";}##tambem funciona
        }close FILE1;

while(<FILE2>){
	my @prefix = split(":",$_);
        push @entries, $prefix[0] if /\b$i\b/
        ##if (/\b$i\b/){print $prefix[0],"\n";}##tambem funciona	
	}close FILE2;
	
$R->set( 'x', \@entries );
my $x = $R->get('x');
print $x;
}

##------------------------------------------------------------------------



