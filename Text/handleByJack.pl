#!/usr/bin/perl
#

#@array; this array is redundant
#$index = 1;
@arrWavFileNames = glob '../wave/*.wav';
for(@arrWavFileNames)
{
	s/..\/wave\///;
	s/wav/lab/;
	$_ = "\"*/".$_."\"";
	#$array[$index] = $_;
	#$index++;
}

print "dos2unix...\n";

open READ,"yu_handel.txt" or die "Erroe in line 21, cannot open file ";
@input = <READ>;
chomp @input;
close READ;
open WRITE,'>yu_rel.txt';
print WRITE "#!MLF!#\n";

$indexOfArrFileNames = 0;
for(@input)
{
	my @arrSplit = split /\s/;
	print WRITE $arrWavFileNames[$indexOfArrFileNames];print WRITE "\n";
	$index++;	
	#for($k = 0;$k <= $#arrSplit; $k++)
	#{
	#	print WRITE $arrSplit[$k];print WRITE "\n";
	#}
	for(@arrSplit)
	{
		print WRITE $_;print WRITE "\n";	
	}

	print WRITE ".";print WRITE "\n";
}



close WRITE;
print "OVer .... \n";




