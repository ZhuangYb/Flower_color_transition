# please select "Domain Hits--> Standard" for your output from "Web CD-search Tool" 
# Usage: perl myb_counter.pl your_output_file
# If you have any question, please email yongbin.zhuang@colorado.edu

#!/user/bin/perl -w
my($input,$line,$count,$key);
my(@entry,@domain);
my(%myb);

$input=shift @ARGV;
open(FILE,"$input");
@entry=<FILE>;

foreach $line(@entry)
{
	if ($line=~/Myb_DNA/)
	{
		$line=~/>(.+?)\s+/;
		if($myb{$1})
		{
			$myb{$1}=$myb{$1}+1;
		}
		else
		{
			$myb{$1}=1;
		}
	}
}
print "ID","	","MYBs\n";
foreach $key(sort{$myb{$b} <=> $myb{$a}} keys %myb)
{
	print $key,"	",$myb{$key},"\n";
}