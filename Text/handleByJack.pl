#!/usr/bin/perl
#

@array;
$index = 1;
@fileNames = glob '../wave/*.wav';
for(@fileNames)
{
	s/..\/wave\///;
	s/wav/lab/;
	$_ = "\"*/".$_."\"";
	$array[$index] = $_;
	$index++;
}

print $array[1];print "\n";

print "dos2unix...\n";
#system("dos2unix yu_handel.txt");

open READ,"yu_handel.txt" or die "Erroe in line 21, cannot open file ";
@input = <READ>;
chomp @input;
close READ;
open WRITE,'>yu_rel.txt';
print WRITE "#!MLF!#\n";

$index = 1;
for(@input)
{
	my @arrSplit = split /\s/;
	print WRITE $array[$index];print WRITE "\n";
	$index++;	
	for($k = 0;$k <= $#arrSplit; $k++)
	{
		print WRITE $arrSplit[$k];print WRITE "\n";
	}
	print WRITE ".";print WRITE "\n";
}



close WRITE;
print "OVer .... \n";




