#!/usr/bin/perl -I.

require "date.pm";
require "cares.pm";
require CGI;

$req = new CGI;

my $list = $req->param('list');

header("c-ares Mailing List Archives", "mail");

sub showarchs {
    my ($num, @dirs) = @_;

    my %years;
    my %mos;

    if($num > 0) {
        while(scalar(@dirs) > $num) {
            shift @dirs;
        }
    }

    for(@dirs) {
        if($_ =~ /(\d\d\d\d)-(\d\d)/) {
            $years{$1}=1;
            $mos{$1}{$2}=1;
        }
    }

    @syears = reverse sort keys %years;
    
    print "<p><table class=archive>\n";

    for(@syears) {
        $thisyear=$_;
        my $pr=0;

        print "<tr>\n";
        print "<th>$thisyear</th>\n";

        for my $d (1 .. 12) {
            my $dd = sprintf("%02d", $d);
            if($mos{$thisyear}{$dd}) {
                $year=$1;
                $mon=$2;
                
                printf("<td><a href=\"mail/c-ares-archive-%04d-%02d/\">%s</a></td>\n",
                       $thisyear, $d, substr(&MonthNameEng($d), 0, 3));
            }
            else {
                # blank
                print "<td></td>";
            }
        }
        print "</tr>\n";
    }
    print "</tr></table>\n";

}


sub archive {
    my ($num)=@_;

    my $some_dir="mail";
    opendir(DIR, $some_dir) || die "can't opendir $some_dir: $!";
    my @dirs = sort {$a cmp $b} grep { /^c-ares-archive-/ && -d "$some_dir/$_" } readdir(DIR);
    closedir DIR;

    &showarchs($num, @dirs);

}


print <<END;

<div class=title align=left> c-ares Mailing List Archives</div>
<div class="box">

 Recent mails are <a href="https://lists.haxx.se/pipermail/c-ares/">archived
 here</a>.

<p>
 Mails from August 2021 and earlier are found here:

END

archive(-1);

print <<MOO

<p> <a href="http://lists.haxx.se/listinfo/c-ares">susbcribe
 here</a>

</div>

MOO
    ;

&footer();
