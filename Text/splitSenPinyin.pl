#!/usr/local/bin/perl
use File::stat;

if($#ARGV != 2) 
{
	print "$0: src_file sentence_file pinyin_file\n";
	exit(1);
}

$srcFile  = $ARGV[0];
$sentFile = $ARGV[1];
$pyinFile = $ARGV[2];

#prepare input and output files
open(SRCFILE, "$srcFile") || die "Failed to open $srcFile for input\n";
open(SENTFILE, ">$sentFile") || die "Failed to open SENTFILE for output\n";
open(PYINFILE, ">$pyinFile") || die "Failed to open PYINFILE for output\n";

$idx = 0;
while ($line = <SRCFILE>)
{
	chomp($line);
	# match "(any number of digits)(.)(tab|any number of white spaces)(sentence)"
	if ($line =~ m/(\d*)\.[\t\s]*(.*)/)
	{
		# sentence
		$sent = $2;
		$idx = $idx+1;
		$index= sprintf("Pth_%05d", $idx);
		print SENTFILE "$index\t$sent\n";
	}
	else
	{
		# pinyin
		print PYINFILE "$line\n";
	}
}

close(SRCFILE);
close(SENTFILE);
close(PYINFILE);
