#!usr/bin/perl -w

use strict;

open (hand1, "SraRunTable.txt") or die $!;

while (<hand1>)   {
	chomp;
	next if /^Assay_Type/;
	my @a = split /\t/;
	my $SRR = $a[8];
	
	print "sample $a[8] is $a[19]\n";
	if ($a[19] =~ /SINGLE/ ) {
		print "downloading $SRR SE\n";
		system("fastq-dump", $SRR);
		 }
	else  {
		print "downloading $SRR PE\n";
		system("fastq-dump --split-files", $SRR); }   }

close hand1;

	
		
