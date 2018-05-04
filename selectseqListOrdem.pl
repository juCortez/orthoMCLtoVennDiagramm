#!/usr/bin/perl


#Este script usa um arquivo lista ordenada como referencia para extrair a seguencia completa de um outro arquivo prank fasta
 
use strict;
use warnings;
use autodie; # die if problem reading or writing a file
use Statistics::R;
my @list=("Serg","Tbru","Lmajor","Tgrayi");
my $R = Statistics::R->new();
my $temp;
my $counter = 0;
$R->send("library(gplots);");
$R->send('library("venneuler");');
foreach my $i (@list){
	$counter++;
my @entries;
my $file = "out".$i;
open FILE1, $ARGV[0] or die $!; #lista
open FILE2, $ARGV[1] or die $!; #prank fasta file
open (wFile, ">> $file") or die $!;
while(<FILE1>){
        my @prefix = split(":",$_);
        push @entries, $prefix[0] if /\b$i\b/;
        if (/\b$i\b/){print wFile $prefix[0],"\n";}##tambem funciona
        }close FILE1;

while(<FILE2>){
	my @prefix = split(":",$_);
        push @entries, $prefix[0] if /\b$i\b/;
        if (/\b$i\b/){print wFile $prefix[0],"\n";}##tambem funciona	
	}close FILE2;
	if ($counter<scalar(@list)){$temp .= $i." = ".$i.",";}
	else{$temp .= $i." = ".$i;}
	$R->set($i, \@entries);

}
my $z="v<-venn(list(".$temp."))";
$R->run($z);

# 	$R->set($i, \@entries);
# }
# $R->run(q'v<-venn(list(A=Serg,B=Tbru,C=Lmajor))');
##########q'v<-venn(list(Serg = Serg,Tbru = Tbru,Lmajor = Lmajor))'
##------------------------------------------------------------------------
