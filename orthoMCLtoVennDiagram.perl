#!/usr/bin/perl


#Este script usa os arquivos groups.txt e singletons.txt para construir diagrama de venn multidimensional!!!! 
##A saida é um pdf Rplots.pdf!!!!fácil!!
use strict;
use warnings;
use autodie; # die if problem reading or writing a file
use Statistics::R;
my @list=("Serg","Lmajor","Tgrayi");## liste seus organismos!!!!!
my @colors=("green","red","yellow");## liste suas cores!!!!!
my $R = Statistics::R->new();
my $temp;
my $color;
my $counter = 0;
$R->send('library("gplots");');
$R->send('library("venneuler");');
$R->send('library("VennDiagram");');
foreach my $i (@list){
	$counter++;
my @entries;
my $file = "out".$i;
open FILE1, $ARGV[0] or die $!; #groups.txt
open FILE2, $ARGV[1] or die $!; #singletons.txt
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
	if ($counter<scalar(@list)){$temp .= $i." = ".$i.",";$color .= '"'.$colors[$counter-1].'"'.",";}
	else{$temp .= $i." = ".$i;$color .= '"'.$colors[$counter-1].'"';}
	$R->set($i, \@entries);

}
my $gplots="v<-venn(list(".$temp."))";
$R->run($gplots);
my $vDiagram='vD<-venn.diagram(list('.$temp.'),fill=c('.$color.'),cex=1.5,filename="vD.pdf")';
$R->run($vDiagram);

##------------------------------------------------------------------------
