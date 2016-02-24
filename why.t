#include "doctype.t"
<head>
<title>c-ares: Reasons for Existance</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"

TITLE(Why does c-ares exist?)
BOXTOP
<p>

 Several years ago we started looking for an asynchronous DNS resolver library
to use in <a href="http://curl.haxx.se/libcurl/">libcurl</a>. We found none
that met our requirements (see below) and started the <a
href="http://libdenise.sourceforge.net/">libdenise</a> project to rectify.

<p>
 During this work, someone pointed out the <a
href="ftp://athena-dist.mit.edu/pub/ATHENA/ares">ares</a> library and heureka!
This was almost exactly what we were looking for. We started expanding it and
soon discovered that the ares author wasn't prepared to accept the changes we
deemed necessary, and so c-ares was born.

<h2>Requirements</h2>
SUBTITLE(1. Interface)
<p>
  a. Provide both synchronous and asynchronous interfaces.
<p>
 b. Synchronous interface: Should support common interfaces, such
 as gethostbyname() and getaddrinfo(). (this is not fulfilled)
<p>
 c. Asynchronous interface: Should be based on non-blocking sockets.
<p>
  d. Must not use signals as a mean of communication.
<p>
SUBTITLE(2. Queries)
<p>
 a. Must support both IPv4 and IPv6 addresses.
<p>
 b. Must support hostname and address lookup (A and PTR types)
<p>
 c. Could support other types of lookup (e.g. CNAME and MX types)
<p>

SUBTITLE(3. Integration)
<p>
 a. Should integrate easily with applications, and particularly,
 their mainloop implementations. (partly fulfilled, still a little too
 attached to select() )
<p>

SUBTITLE(4. Portability)
<p>
 a. Must be portable to most commonly used platforms (Linux, Solaris,
    Win32, etc).
<p>
 b. Should be portable to as many platforms as possible.
<p>
 c. Should not rely on hardware or compiler specifics, e.g. endianess
    and size/alignment of primitive types.
<p>
SUBTITLE(5. Multi-threading)
<p>
 a. Must not require multi-threading.
<p>
 b. Must work correctly in multi-threaded environments.

SUBTITLE(6. Licensing)
<p>
 a. Must allow use in Open Source and proprietary projects.

BOXBOT

#include "footer.t"
