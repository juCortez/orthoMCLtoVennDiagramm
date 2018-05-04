#!/usr/bin/perl

use strict;
use warnings;

A: while(my $linha = <>) {
    my %orgs;
    chomp $linha;
    my @brk = split(/\s+/, $linha);
    next if scalar(@brk) != 12;
    my $id = shift @brk;
    foreach my $one (@brk) {
	my @tmp = split(/\|/, $one);
	next A if exists $orgs{$tmp[0]};
	$orgs{$tmp[0]}++;
    }
    print "$linha\n";
}
