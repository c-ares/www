#include "doctype.t"
<head>
<title>c-ares changelog</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"

TITLE(c-ares changes over time)
BOXTOP

The full changelog of the c-ares project's history.

<p>
<a name="1_12_0"></a>
SUBTITLE(c-ares version 1.12.0 - Sep 29 2016)
<p>
Changes:
<ul>
 <li> api: add ARES_OPT_NOROTATE optmask value
</ul>
<p>
Bug fixes:
<ul>
 <li> <a href="https://c-ares.haxx.se/adv_20160929.html">CVE-2016-5180: ares_create_query single byte out of buffer write</a>
 <li> configure: acknowledge --disable-tests [1]
 <li> man pages: fix typos detected by Lintian
 <li> test: add missing #includes for dns-proto.cc
 <li> test: avoid in6addr_* constants
 <li> test: Build with MinGW on AppVeyor
 <li> Makefile.m32: add support for extra flags
 <li> Makefile.m32: add support for CROSSPREFIX
 <li> configure: check if tests can get built before enabled
 <li> ares_library_cleanup: reset ares_realloc too
 <li> ahost.c: add cast to fix C++ compile
 <li> test: Only pass unused args to GoogleTest
 <li> build: commonize MSVC version detection
 <li> msvc_ver.inc: support Visual Studio 2015 Update 1, 2, 3
 <li> test: for AF_UNSPEC, return CNAME only for AAAA, but valid A record
 <li> ares_getnameinfo: explicitly clear struct servent before use
 <li> test: Update fuzzing function prototype
 <li> init: fix nsort initialization
 <li> test: add fuzzing check script to tests
 <li> web: http => https
 <li> read_tcp_data: remove superfluous NULL check
 <li> LICENSE.md: add a stand-alone license file
 <li> SECURITY.md: suggested "security process" for the project
 <li> ares_init_options: only propagate init failures from options [2]
 <li> headers: remove checks for and defines of variable sizes
 <li> test: fix gMock to work with gcc >= 6.x [3]
</ul>

<p>
<a name="1_11_0"></a>
SUBTITLE(c-ares version 1.11.0 - Feb 19 2016)
<p>
Changes:
<ul>
 <li> Add a unit test suite
 <li> Allow builds with code converage with --enable-code-coverage configure option
 <li> Allow library-wide override of malloc/free
 <li> Allow multiple -s options to the ahost command
 <li> api: Expose the ares_library_initialized() function
 <li> api: Add ares_set_sortlist(3) entrypoint
 <li> api: Add entrypoints to allow use of per-server ports
 <li> api: introduce `ares_parse_txt_reply_ext`
 <li> api: Add ares_set_socket_configure_callback()
</ul>

<p>
Bug fixes:
<p>
<ul>
 <li> timeadd: make static
 <li> timeoffset: made static and private
 <li> nowarn: use <limits.h> instead of configure for size of long
 <li> single_domain: Invalid memory access for empty string input
 <li> ares_build.h: fix building on 64-bit powerpc
 <li> Allow specification of search domain in ahost
 <li> Don't override explicitly specified search domains
 <li> ares_parse_soa_reply: Do not leak rr_name on allocation failure
 <li> Update ahost man page to describe -s option
 <li> host_callback: Fall back to AF_INET on searching with AF_UNSPEC
 <li> Add -t u option to ahost
 <li> CONTRIBUTING: added
 <li> ares_set_servers_csv: fix NULL dereference
 <li> Fix integer shift overflow if both tcp_socket and udp_socket are set
 <li> fix acountry memory leak
 <li> lookup_service: prevent tmpbuf from overrunning
 <li> ares_getnameinfo.3: there is no ares_getaddrinfo
 <li> init_by_defaults: Continue loop if space for hostname not large enough
 <li> Destroy options if ares_save_options fails
 <li> ares__read_line: free buf on realloc failure
 <li> added define for visual studio 2013
 <li> windows: fix slow DNS lookup issue
 <li> Use libresolv to initialize cares on iPhone targets
 <li> buildconf: remove check for libtool, it only requires libtoolize
 <li> init_by_resolv_conf: Don't exit loop early leaving uninitialized entries
 <li> ahost: check the select() return code
 <li> configure_socket: explicitly ignore return code
 <li> read_tcp_data: don't try to use NULL pointer after malloc failure
 <li> Distribute all man pages
 <li> ares_expand_name: check for valid bits in label length
 <li> ares__read_line: clear buf pointer on realloc failure
 <li> process_answer: fix things up correctly when removing EDNS option
 <li> ares_parse_txt_reply: propagate errors from per-substring loop
 <li> ares_gethostbyname: don't leak valid-but-empty hostent
 <li> ares_init_options: don't lose init failure
 <li> ares_dup: clear new channel on failure
 <li> config_sortlist: free any existing sortlist on (re)alloc failure
 <li> ares_striendstr: fix so non-NULL return can happen
 <li> bitncmp: update comment to match code behaviour
 <li> ares_set_servers_csv.3: make return type match code
 <li> init_by_resolv_conf: ignore `fopen` errors to use default values
 <li> Use "resolve" as synonym of "dns" in nsswitch.conf
 <li> ares_win32_init: make LoadLibrary work when using UNICODE too
 <li> dist: Distribute README.md
 <li> configure: build silently by default
 <li> ares_dup.3: remove mention of nonexistent function
</ul>

<a name="1_10_0"></a>
SUBTITLE(c-ares version 1.10.0 - May 12 2013)
<p>
Changes:
<p>
<ul>
 <li> Added ares_create_query(), to be used instead of ares_mkquery()
 <li> ares_inet_ntop() and ares_inet_pton() are now recognized c-ares functions
	</ul>
	<p>
Bug fixes:
<p><ul>
 <li> include the ares_parse_soa_reply.* files in the tarball
 <li> read_udp_packets: bail out loop on bad sockets
 <li> get_DNS_AdaptersAddresses: fix IPv6 parsing
 <li> adig: perror() doesn't work for socket errors on windows
 <li> ares_parse_aaaa_reply: fix memory leak
 <li> setup_once.h: HP-UX <sys/socket.h> issue workaround
 <li> configure: several fixes
 <li> config-dos.h: define strerror() to strerror_s_() for High-C
 <li> config-dos.h: define HAVE_CLOSE_S for MSDOS/Watt-32
 <li> ares_build.h.dist: enhance non-configure GCC ABI detection logic
 <li> ares.h: stricter CARES_EXTERN linkage decorations logic
 <li> ares_cancel(): cancel requests safely
 <li> protocol parsing: check input data stricter
 <li> library init: be recursive, reference count inits/cleanups
 <li> ares_parse_txt_reply: return a ares_txt_reply node for each sub-string
 <li> ares_set_servers_csv: fixed IPv6 address parsing
 <li> build: fix build on msvc11
</ul>

SUBTITLE(c-ares version 1.9.1 - Jun 18 2012)
<p>
Fixed:
<p><ul>
 <li> include the ares_parse_soa_reply.* files in the tarball
</ul>

SUBTITLE(c-ares version 1.9.0 - Jun 17 2012)
<p>
Changed:
<p><ul>
 <li> Added ares_parse_soa_reply
</ul>
<p>
Fixed:
<p><ul>
 <li> libcares.pc generation for static MingW* cross builds
 <li> ares_dup: UDP and TCP port byte order in saved options
</ul>

SUBTITLE(c-ares version 1.8.0 - Apr 27 2012)
<p>
Changed:
<p><ul>
 <li> Added ares_parse_naptr_reply()
</ul>
<p>
Fixed:
<p><ul>
 <li> handle CNAME-only in ares_parse_aaaa_reply()
 <li> support multiple DNS servers on Android
 <li> check for __ANDROID__ in addition to ANDROID macro
 <li> port numbers: convert them to network order
 <li> get_iphlpapi_dns_info: fix buffer overrun
 <li> configure: make CURL_CHECK_DEF ignore leading whitespace
 <li> segfault triggered in ares_init_options()
 <li> ares_getnameinfo's memcpy did not copy enough bytes
 <li> ares_destroy: fix segfault in ares_destroy_options()
 <li> CHANGES: generate from script
 <li> configure: fix symbol hiding usability check
</ul>

SUBTITLE(c-ares version 1.7.5 - Aug 16 2011)
<p>
Fixed:
<p><ul>
 <li> detection of semicolon comments in resolv.conf
 <li> avoid using system's inet_net_pton affected by the WLB-2008080064 advisory
 <li> replacement ares_inet_net_pton affected by the WLB-2008080064 advisory
 <li> replacement ares_inet_ntop affected by potential out of bounds write
 <li> added install target to Makefile.msvc
 <li> only fall back to AF_INET searches when looking for AF_UNSPEC addresses
 <li> fixed ares_parse_*_reply memory leaks
 <li> Use correct sizeof in ares_getnameinfo()
 <li> IPv6-on-windows: find DNS servers correctly
 <li> man pages: docs for the c-ares utility programs
 <li> getservbyport replacement for Win CE
 <li> config_sortlist: (win32) missing else
 <li> advance_tcp_send_queue: avoid NULL ptr dereference
 <li> configure: fix a bashism
 <li> ares_expand_name: Fix encoded length for indirect root
</ul>

SUBTITLE(c-ares version 1.7.4 - Dec 9 2010)
<p>
Changed:
<p><ul>
 <li> local-bind: Support binding to local interface/IPs, see
   ares_set_local_ip4, ares_set_local_ip6, ares_set_local_dev
</ul><p>
Fixed:
<ul>
 <li> memory leak in ares_getnameinfo
 <li> add missing break that caused get_ares_servers to fail
 <li> ares_parse_a_reply: fix CNAME response parsing
 <li> init_by_options: don't copy an empty sortlist
 <li> Replaced uint32_t with unsigned int to fix broken builds
   on a couple of platforms
 <li> Fix lookup with HOSTALIASES set
 <li> adig: fix NAPTR parsing
 <li> compiler warning cleanups
</ul>

SUBTITLE(c-ares version 1.7.3 - Jun 11 2010)
<p>
Fixed:
<p><ul>
 <li> builds on Android
 <li> now includes all files necessary to build it (1.7.2 lacked a file)
</ul>

SUBTITLE(c-ares version 1.7.2 - Jun 10 2010)
<p>
Changed:
<p><ul>
 <li> Added ares_parse_mx_reply()
</ul><p>
Fixed:
<ul>
 <li> ares_init: Last, not first instance of domain or search should win
 <li> improve alternative definition of bool
 <li> fix VS2010 compiler warnings
</ul>

SUBTITLE(c-ares version 1.7.1 - Mar 23 2010)
<p>
 Changed:
<p><ul>
 <li> added IPv6 name servers support
</ul><p>
Fixed:
<ul>
 <li> closing of sockets on Windows systems
 <li> MSVC deprecated compiler options warnings
 <li> ares_process_fd() didn't check broken connections
</ul>

SUBTITLE(c-ares version 1.7.0 - Nov 30 2009)
<p>
Changed:
<p><ul>
 <li> in6_addr is not used in ares.h anymore, but a private ares_in6_addr is
   instead declared and used
 <li> ares_gethostbyname() now supports 'AF_UNSPEC' as a family for resolving
   either AF_INET6 or AF_INET
 <li> a build-time configured ares_socklen_t is now used instead of socklen_t
 <li> new ares_library_init() and ares_library_cleanup() functions
 <li> new --enable-curldebug configure option
 <li> ARES_ECANCELLED is now sent as reason for ares_cancel()
 <li> added ares_parse_srv_reply()
 <li> added ares_parse_txt_reply()
 <li> added ares_free_data()
 <li> new --enable-symbol-hiding configure option
 <li> new Makefile.msvc for any MSVC compiler or MS Visual Studio version
 <li> addrttl and addr6ttl structs renamed to ares_addrttl and ares_addr6ttl
 <li> naming convention for libraries built with MSVC, see README.msvc
</ul>
<p>
Fixed:
<ul>
 <li> ares_parse_*_reply() functions now return ARES_EBADRESP instead of
   ARES_EBADNAME if the name in the response failed to decode
 <li> only expose/export symbols starting with 'ares_'
 <li> fix \Device\TCP handle leaks triggered by buggy iphlpapi.dll
 <li> init without internet gone no longer fails
 <li> out of bounds memory overwrite triggered with malformed /etc/hosts file
 <li> function prototypes in man pages out of sync with ares.h
</ul>

SUBTITLE(c-ares version 1.6.0 - Dec 9 2008)
<p>
Changed:
<p><ul>
 <li> Added support for the glibc "rotate" resolv.conf option (or ARES_OPT_ROTATE)
 <li> Added ares_gethostbyname_file()
 <li> Added ares_dup()
 <li> Added ares_set_socket_callback()
</ul><p>
Fixed:
<p><ul>
 <li> improved configure detection of several functions
 <li> improved source code portability
 <li> adig supports a regular numerical dotted IP address for the -s option
 <li> handling of EINPROGRESS for UDP connects
 <li> ares_parse_ptr_reply() would cause a buffer to shrink instead of expand if a
   reply contained 8 or more records
 <li> buildconf works on OS X
</ul>

SUBTITLE(c-ares version 1.5.3 - Aug 29 2008)
<ul>
 <li> fix adig sample application compilation failure on some systems
 <li> fix pkg-config reporting of private libraries needed for static linking
 <li> fallback to gettimeofday when monotonic clock is unavailable at run-time
 <li> ares_gethostbyname() fallback from AAA to A records with CNAME present
 <li> allow --enable-largefile and --disable-largefile configurations
 <li> configure process no longer needs nor checks size of curl_off_t
 <li> library will now be built with _REENTRANT symbol defined if needed
 <li> Improved configure detection of number of arguments for getservbyport_r
 <li> Improved query-ID randomness
 <li> Validate that DNS response address matches the request address
 <li> fix acountry sample application compilation failure on some systems
</ul>
 
SUBTITLE(c-ares version 1.5.2 - May 29 2008)
<ul>
 <li> code refactoring in ares_gethostbyaddr
 <li> improved checking of /dev/urandom in configure script
 <li> new sample application, acountry
 <li> improved MSVC6 dsp files
 <li> adig sample application supports NAPTR records
 <li> improved file seeding randomizer
 <li> improved parsing of resolver configuration files
 <li> updated configure script to remove autoconf 2.62 warnings
 <li> use monotonic time source if available
 <li> return all PTR-records when doing reverse lookups
 <li> millisecond resolution support for the timeout option
</ul>


SUBTITLE(c-ares version 1.5.1 - Nov 21 2007)
<ul>
 <li> added the ares_llist.h header that was missing in the 1.5.0 release
</ul>

SUBTITLE(c-ares version 1.5.0 - Nov 21 2007)
<ul>
 <li> SONAME bump to a few API and ABI breaking changes:
   - ares_host_callback()
   - ares_nameinfo_callback()
   - ares_parse_a_reply()
   - ares_parse_aaaa_reply()

 <li> two valgrind reports were silenced
 <li> ares_save_options() fix
 <li> do DNS retries even on TCP connections
 <li> correctly clear sockets from the fd_set in several functions
 <li> always wait on TCP events to detect connect closures
 <li> new socket options: ARES_OPT_SOCK_SNDBUF and ARES_OPT_SOCK_RCVBUF
 <li> made the query callbacks receive the number of timeouts that happened during
   the execution of a query
 <li> don't skip a server if it's the only one
 <li> segfault when generating a DNS "Transaction ID" under low memory conditions
 <li> ares_strerror() segfault fix
 <li> added copyright texts to a few places that were missing them
</ul>

SUBTITLE(c-ares version 1.4.0 - Jun 8 2007)
<ul>
 <li> fixed VS2005 compiler warnings due to time_t being 64bit
 <li> introduced cryptographically secure transaction IDs
 <li> added ares_save_options()
 <li> added ares_destroy_options()
 <li> added ares_process_fd()
 <li> fixed undefined return value in init_by_resolv_conf() function for windows
 <li> added ares_parse_ns_reply()
 <li> fix failure to get the search sequence of /etc/hosts and DNS from
   /etc/nsswitch.conf, /etc/host.conf or /etc/svc.conf when /etc/resolv.conf
   did not exist
 <li> when domains were sert in the options struct, and there were domain/search
   entries in /etc/resolv.conf, the domains of the options struct would be
   overridden
 <li> removed a couple of potential zero size memory allocations
 <li> fixed the line endings in areslib.dsp
</ul>

BOXBOT

#include "footer.t"
