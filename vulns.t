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
SUBTITLE(CVE-2023-32067 - May 22 2023)
<p>
  High. 0-byte UDP payload causes Denial of Service. Fixed in 1.19.1
<p>
SUBTITLE(CVE-2023-31147 - May 22 2023)
<p>
 Moderate. Insufficient randomness in generation of DNS query IDs. Fixed in 1.19.1
<p>
SUBTITLE(CVE-2023-31130 - May 22 2023)
<p>
 Moderate. Buffer Underwrite in ares_inet_net_pton(). Fixed in 1.19.1
<p>
SUBTITLE(CVE-2023-31124 - May 22 2023)
<p>
 Low. AutoTools does not set CARES_RANDOM_FILE during cross compilation. Fixed in 1.19.1
<p>
SUBTITLE(CVE-2022-4094 - Feb 17 2023)
<p>
The ares_set_sortlist is missing checks about the validity of the input
string, which allows a possible arbitrary length stack overflow. This issue
may cause a denial of service or a limited impact on confidentiality and
integrity. Fixed in 1.19.0
<a href="https://access.redhat.com/security/cve/cve-2022-4904">CVE-2022-4094</a>

<p>
SUBTITLE(CVE-2021-3672 - August 10 2021)
<p>
 <a href="adv_20210810.html">Missing input validation on hostnames returned by DNS servers</a>

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
href="https://c-ares.org/mail/c-ares-archive-2007-06/0011.shtml">project
advisory</a>.

<p> For unknown reasons, it seems CVE-2007-3152 is also often used to refer to
this same issue.

<p>
 This flaw was fixed in 1.4.0.


BOXBOT

#include "footer.t"
