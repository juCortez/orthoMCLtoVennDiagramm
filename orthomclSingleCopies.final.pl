#!/usr/bin/perl
#script to find genes on .tab file from get_homologues


use strict;
use warnings;

my @organism=("Adeanei", "Cfasciculata", "Lmajor", "Phyto", "Serg", "Tgravi",
        "BayalaiB08", "Herpetomonas", "Lpyrr", "Sculicis", "Tbrucei");
my @columm;
my @temp;

while(my $linha = <>){
    my @name=();
    chomp $linha;
    my $x=0;
    @columm=split (" ", $linha);
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
                if($x == 0){print $linha,"\n";}
    }
}
