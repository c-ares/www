#include "doctype.t"
<head>
<title>c-ares vulnerabilities</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"

TITLE(c-ares vulnerabilities)
BOXTOP

 This is all known and public c-ares vulnerabilities to date. See also our <a
 href="security.html">security incident process</a>.

<p>
SUBTITLE(CVE-2017-1000381 - June 20 2017)
<p>
 <a href="adv_20170620.html">NAPTR parser out of bounds access</a>

<p>
SUBTITLE(CVE-2016-5180 - Sep 29 2016)
<p>
 <a href="adv_20160929.html">ares_create_query single byte out of buffer write</a>

<p>
SUBTITLE(CVE-2007-3153 - Jun 8 2007)
<p>

 The ares_init:randomize_key function uses the rand command to produce random
numbers. A remote attacker could exploit this vulnerability to possibly spoof
hostnames and addresses in the DNS cache. <a
href="https://c-ares.haxx.se/mail/c-ares-archive-2007-06/0011.shtml">project
advisory</a>.

<p> For unknown reasons, it seems CVE-2007-3152 is also often used to refer to
this same issue.

<p>
 This flaw was fixed in 1.4.0.


BOXBOT

#include "footer.t"
