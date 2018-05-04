#!/usr/bin/perl


#Este script usa um arquivo lista ordenada como referencia para extrair a seguencia completa de um outro arquivo prank fasta
 
use strict;
use warnings;
use autodie; # die if problem reading or writing a file
my @list=("Serg","Tbru","Lmajor");

foreach $i (@list){
open FILE1, $ARGV[0] or die $!; #lista
open FILE2, $ARGV[1] or die $!; #prank fasta file
while(<FILE1>){
        print $_ if /\b$i\b/
        }close FILE1;
while(<FILE2>){
		
	}close FILE2;
}
##------------------------------------------------------------------------
my @list=("Serg","Tbru","Lmajor");

foreach my $i (@list){
open FILE1, $ARGV[0] or die $!; #lista
print $i,"\n";
while(<FILE1>){
        my @prefix = split(":",$_);
        print $prefix[0],"\n" if /\b$i\b/
	##if (/\b$i\b/){print $prefix[0],"\n";}##tambem funciona
        }close FILE1;
}
use Statistics::R;

my @numbers = ( 1 .. 10 );

my $R = Statistics::R->new();
$R->set( 'x', \@numbers );
$R->run( q`x = x ^ 2` );
my $squares = $R->get('x');

print "@$squares";

