#include "doctype.t"
<head>
<title>c-ares: Other Libraries Evaluation</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"

TITLE(What Other Libraries Are There?)
BOXTOP
<p>
 Some of these libraries existed at the time we started looking for one to
 use, but several have appeared or changed a lot since.

<p>
<table>
<tr valign=top><td> glibc-2.2.4</td><td>
 (and maybe a few earlier releases) provides a new function getaddrinfo_a() --
  similar to getaddrinfo(), but asynchronous.  results can be collected by
  polling or notified using a signal. This is probably the right thing to do
  on linux, although the use of a signal handler within the library could be
  problematic (if a linking application also wants to use the same signal).
</td></tr>
<tr><td> <a href="http://www.chiark.greenend.org.uk/~ian/adns/">ADNS</a> </td>
<td>
  ADNS is a GPL library which provides async DNS lookup.
</td></tr>
<tr><td><a href="http://www.mozilla.org/docs/netlib/">Mozilla netlib</a></td>
<td> Provides an async DNS lookup
  abstraction, and per-platform backend implementations.  it's written on top
  of the NSPR (portable runtime), and so it's use would require a whole chunk
  of Mozilla code.
</td></tr>
<tr><td> arlib </td>
<td> BIND v4.9.5's contrib section had a thing called arlib, from Darren Reed.
  looks pretty simple.  its licence prohibits redistribution without explicit
  permission. It doesn't seem to be in BIND9 though,
  so it might not work anymore.
</td></tr>
<tr><td><a href="http://directory.fsf.org/project/FireDNS/">FireDNS</a></td>
<td>
  GPL. We asked the author about reconsidering the license. No luck.
</td></tr>
<tr><td><a href="http://cr.yp.to/djbdns.html">djbdns</a></td>
<td> Written by Dan Bernstein and dedicated to the public domain.
</td></tr>
<tr><td><a href="http://www.posadis.org/">Poslib</a></td>
<td>
  GPL. A DNS client/server library written in C++. Available for many
  platforms, including Linux, FreeBSD, other Unices and Windows.
</td></tr>
<tr><td><a href="http://www.corpit.ru/mjt/udns.html">UDNS</a></td>
<td>
LGPL license. A newcomer that seems to address claimed shortcomings in ADNS
and c-ares.
</td></tr>

<tr><td><a href="http://25thandclement.com/~william/projects/dns.c.html">dns.c</a></td>
<td>

 MIT-style license. A recursive, reentrant, non-blocking DNS resolver library
 in a single .c file.

</td></tr>
</table>
BOXBOT

#include "footer.t"
