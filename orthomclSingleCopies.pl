#!/usr/bin/perl
#script to find single copies genes 
#usage: perl orthomclSingleCopies.pl groups.txt(orthomcloutput)

use strict;
use warnings;

my @columm;
my @temp;

while(<>){
    my @name=();
    my $x=0;
    @columm=split (" ");
    if (scalar(@columm) == 12){
        my $counter=11;
        foreach my $var (@columm){
            @temp=split(/\|/, $var);
            push(@name, $temp[0]);
        }
        foreach my $i (1..$counter-1){
            foreach my $j (1..$counter-$i){
                    if($name[$i] eq $name[$j+$i]){
                        $x=$x+1;
                    }
            }
        }
                if($x == 0){print $_;}
    }
}

