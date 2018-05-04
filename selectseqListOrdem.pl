#!/usr/bin/perl


#Este script usa um arquivo lista ordenada como referencia para extrair a seguencia completa de um outro arquivo prank fasta
 
use strict;
use warnings;
use autodie; # die if problem reading or writing a file

my $string="";

open FILE1, $ARGV[0] or die $!; #lista
while(<FILE1>){	
	my $position=0;
	$string=$_;
	open FILE2, $ARGV[1] or die $!; #prank fasta file
	while(<FILE2>){
		if($_ eq $string ){
			$position++;
			if($position==1){print $_;}			 
		}else{
			if(/^>/){$position=0;}
			if($position==1){print $_;}
			}
	}close FILE2;
}close FILE1;
exit;
