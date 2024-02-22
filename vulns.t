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
SUBTITLE(CVE-2024-25629 - Feb 23 2024)
<p>
  Moderate. Reading malformatted <pre>/etc/resolv.conf</pre>, <pre>/etc/nsswitch.conf</pre> or the <pre>HOSTALIASES</pre> file could result in a crash. Fixed in 1.27.0. <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-mg26-v6qh-x48q">CVE-2024-25629</a>
<p>
SUBTITLE(CVE-2023-32067 - May 22 2023)
<p>
  High. 0-byte UDP payload causes Denial of Service. Fixed in 1.19.1. <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-9g78-jv2r-p7vc">CVE-2023-32067</a>
<p>
SUBTITLE(CVE-2023-31147 - May 22 2023)
<p>
 Moderate. Insufficient randomness in generation of DNS query IDs. Fixed in 1.19.1. <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-8r8p-23f3-64c2">CVE-2023-31147</a>
<p>
SUBTITLE(CVE-2023-31130 - May 22 2023)
<p>
 Moderate. Buffer Underwrite in ares_inet_net_pton(). Fixed in 1.19.1. <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-x6mf-cxr9-8q6v">CVE-2023-31130</a>
<p>
SUBTITLE(CVE-2023-31124 - May 22 2023)
<p>
 Low. AutoTools does not set CARES_RANDOM_FILE during cross compilation. Fixed in 1.19.1. <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-54xr-f67r-4pc4">CVE-2023-31124</a>
<p>
SUBTITLE(CVE-2022-4904 - Feb 17 2023)
<p>
The ares_set_sortlist is missing checks about the validity of the input
string, which allows a possible arbitrary length stack overflow. This issue
may cause a denial of service or a limited impact on confidentiality and
integrity. Fixed in 1.19.0
<a href="https://access.redhat.com/security/cve/cve-2022-4904">CVE-2022-4904</a>

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
