#!/usr/bin/perl
#

@fileName = glob 'wave/*.wav';

open WRITE,'>fileNameList.scp';

for(@fileName)
{
	s/wave/data/;
	print WRITE $_;print WRITE "\n";

}


close WRITE;

