#include "doctype.t"
<head>
<title>c-ares changelog</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"

#define CHG <li>
#define BGF <li>

TITLE(c-ares changes over time)
BOXTOP
<p>
<a name="1_25_0"></a>
SUBTITLE(c-ares version 1.25.0 - Jan 3 2024)
<p>Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/674">AutoTools: rewrite build system to be lighter weight and fix issues in some semi-modern systems. It is likely this has broken building on some less common and legacy OSs, please report issues. </a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/88c444d">Rewrite ares_strsplit() as a wrapper for ares__buf_split() for memory safety reasons.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/669">The ahost utility now uses ares_getaddrinfo() and returns both IPv4 and IPv6 addresses by default.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/659">OpenBSD: Add SOCK_DNS flag when creating socket.</a>
</ul>
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/commit/1231aa7">Tests: Live reverse lookups for Google's public DNS servers no longer return results, replace with CloudFlare pubic DNS servers.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/673">MacOS legacy SDKs require sys/socket.h before net/if.h</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/05181a6">Connection failures should increment the server failure count first or a retry might be enqueued to the same server.</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/eebfe0c">On systems that don't implement the ability to enumerate network interfaces the stubs used the wrong prototype.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/666">Fix minor warnings and documentation typos.</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/d186f11">Fix support for older GoogleTest versions.</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/665">getrandom() may require sys/random.h on some systems.</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/664">Fix building tests with symbol hiding enabled.</a>
</ul>
<p>
<a name="1_24_0"></a>
SUBTITLE(c-ares version 1.24.0 - Dec 17 2023)
<p>Features:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/646">Add support for IPv6 link-local DNS servers.  Nameserver formats can nowaccept the &percnt;iface suffix, and a new ares_get_servers_csv() function was added to return servers that can contain the link-local interface name. </a>
</ul>
<p>Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/655">Unbundle GoogleTest for test cases.  Package maintainers will now need to require GoogleTest (GMock) as a build dependency if building tests. New GoogleTest versions require C++14 or later. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/643">Replace nameserver parsing code to use new memory-safe functions.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/653">Replace the sortlist parser with new memory-safe functions.</a>
 <li> Various warning fixes and dead code removal.
</ul>
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/644">Old Linux versions require POSIX_C_SOURCE or _GNU_SOURCE to compile with thread safety support. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/650">A non-responsive DNS server that caused timeouts wouldn&apos;t increment the failure count, this would lead to other servers not being tried.  Regression introduced in 1.22.0. </a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/c982bf4">Some projects that depend on c-ares expect invalid parameter option values passed into ares_init_options() to simply be ignored.  This behavior has been restored. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/661">On linux getrandom() can fail if the kernel doesn&apos;t support the syscall, fall back to another random source. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/663">ares_cancel() when performing ares_gethostbyname() or ares_getaddrinfo() with AF_UNSPEC, if called after one address class was returned but before the other address class, it would return ARES_SUCCESS rather than ARES_ECANCELLED. </a>
</ul>
<p>
<a name="1_23_0"></a>
SUBTITLE(c-ares version 1.23.0 - Nov 30 2023)
<p>Features:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/636">Introduce optional (but on by default) thread-safety for the c-ares library.  This has no API nor ABI implications. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/632">resolv.conf in modern systems uses attempts and timeouts options instead of the old retrans and retry options. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/625">Query caching support based on TTL of responses. Can be enabled via ares_init_options() with ARES_OPT_QUERY_CACHE. </a>
</ul>
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/commit/fb52c3f">ares_init_options() for ARES_OPT_UDP_PORT and ARES_OPT_TCP_PORT accept the port in host byte order, but it was reading it as network byte order.  Regression introduced in 1.20.0. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/638">ares_init_options() for ARES_FLAG_NOSEARCH was not being honored for ares_getaddrinfo() or ares_gethostbyname().  Regression introduced in  1.16.0. </a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/f4d8c9a">Autotools MacOS and iOS version check was failing</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/b674abd">Environment variables passed to c-ares are meant to be an override for system configuration. Regression introduced in 1.22.0. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/634">Spelling fixes as detected by codespell.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/633">The timeout returned by ares_timeout() was truncated to milliseconds but validated to microseconds which could cause a user to attempt to process timeouts prior to the timeout actually expiring. </a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/33ee6c0">CMake was not honoring CXXFLAGS passed in via the environment which could cause compile and link errors with distribution hardening flags during packaging. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/627">Fix Windows UWP and Cygwin compilation.</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/320cefe">ares_set_servers_*() for legacy reasons needs to accept an empty server listand zero out all servers. This results in an inoperable channel and thus is only used in simulation testing, but we don&apos;t want to break users.  Regression introduced in 1.21.0. </a>
</ul>
<p>
<a name="1_22_1"></a>
SUBTITLE(c-ares version 1.22.1 - Nov 19 2023)
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/commit/a36317">Fix /etc/hosts processing performance with all entries using same IPaddress. Large hosts files using the same IP address for all entries  could use exponential time. </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/619">Fix typos in manpages</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/623">Fix OpenWatcom building</a>
</ul>

<p>
<a name="1_22_0"></a>
SUBTITLE(c-ares version 1.22.0 - Nov 14 2023)
<p>Features:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/614">ares_reinit() is now implemented to re-read any system configuration and immediately apply to an existing ares channel </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/607">The adig command line program has been rewritten and its format now more closely matches that of BIND&apos;s dig utility </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/604">The new DNS message parser and writer functions have now been made public</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/603">RFC9460 HTTPS and SVCB records are now supported</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/600">RFC6698 TLSA records are now supported</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/594">The server list is now internally dynamic and can be changed without impacting existing queries </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/591">Hosts file processing is now cached until the file is detected to be changed to speed up repetitive lookups of large hosts files </a>
</ul>
<p>Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/598">Internally all DNS messages are now written using the new DNS writing functions </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/596">EDNS is now enabled by default</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/595">Internal cleanups in function prototypes</a>
</ul>
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/606">Randomize retry penalties to prevent thundering herd issues when dns servers throttle requests </a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/594">Fix Windows build error for missing if_indextoname()</a>
</ul>

<p>
<a name="1_21_0"></a>
SUBTITLE(c-ares version 1.21.0 - Oct 27 2023)
<p>Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/565">Provide better man page cross-links.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/567">Introduce ares_status_t as an enum rather than using #define list and
   integer data type for internal functions.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/570">Introduce ares_bool_t datatype rather than using an integer with 0/1 so
   it is clear based on the function prototype what it returns.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/568">Increase compiler warning levels by default.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/573">Use size_t and other more proper datatypes internally (rather than int).</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/579">Many developers have used different code styles over the years, standardize
   on one and use clang-format to enforce the style.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/574">CMake can now control symbol visibility</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/581">Replace multiple DNS hand-made parsers with new memory-safe DNS message
 parser.</a>
</ul>

<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/569">Tools: STAYOPEN flag could make tools not terminate.</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/a070d78">Socket callbacks were passed SOCK_STREAM instead of SOCK_DGRAM on udp.</a>
</ul>

<p>
<a name="1_20_1"></a>
SUBTITLE(c-ares version 1.20.1 - Oct 8 2023)
<p>Bugfixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/562">Resolve use-after-free issue when TCP connection is terminated before a
   response is returned</a>
 <li> Reduce number of queries for a load test case to prevent overloading some
   build systems
 <li> <a href="https://github.com/c-ares/c-ares/pull/559">Fix fuzz test build target</a>
</ul>

<p>
<a name="1_20_0"></a>
SUBTITLE(c-ares version 1.20.0 - Oct 7 2023)
<p>Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/556">Update from 1989 MIT license text to modern MIT license text</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/554">Remove acountry from built tools as nerd.dk is gone</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/549">Add new ARES_OPT_UDP_MAX_QUERIES configuration option to limit the number of queries that can be made from a single ephemeral port</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/542">Default per-query timeout has been reduced to 2s with a 3x retry count</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/540">Modernization: start implementing some common data structures that are easy
   to use and hard to misuse.  This will make code refactoring easier and remove
   some varied implementations in use.  This change also makes ares_timeout()
   more efficient</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/c1b00c41">Use SPDX identifiers and a REUSE CI job to verify</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/526">rand: add support for getrandom()</a>
</ul>
<p> Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/552">TCP back to back queries were broken</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/553">Ensure queries for ares_getaddrinfo() are not requeued during destruction</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/551">ares_getaddrinfo() should not retry other address classes if one address
   class has already been returned</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/546">Avoid production ill-formed result when qualifying a name with the root
   domain</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/530">Fix missing prefix for CMake generated libcares.pc</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/534">DNS server ports will now be read from system configuration instead of
   defaulting to port 53</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/527">Remove some unreachable code</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/525">Replace usages of sprintf with snprintf</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/524">Fix Watcom instructions and update Windows URLs</a>
</ul>
<p>
<a name="1_19_1"></a>
SUBTITLE(c-ares version 1.19.1 - May 22 2023)
<p> Security:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-9g78-jv2r-p7vc">CVE-2023-32067</a>. High. 0-byte UDP payload causes Denial of Service</a>
 <li> <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-8r8p-23f3-64c2">CVE-2023-31147</a> Moderate. Insufficient randomness in generation of DNS
   query IDs
 <li> <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-x6mf-cxr9-8q6v">CVE-2023-31130</a>. Moderate. Buffer Underwrite in ares_inet_net_pton()
 <li> <a href="https://github.com/c-ares/c-ares/security/advisories/GHSA-54xr-f67r-4pc4">CVE-2023-31124</a>. Low. AutoTools does not set CARES_RANDOM_FILE during cross
   compilation
</ul>

<p> Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/515">Fix uninitialized memory warning in test</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/520">Turn off IPV6_V6ONLY on Windows to allow IPv4-mapped IPv6 addresses</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/517">ares_getaddrinfo() should allow a port of 0</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/511">Fix memory leak in ares_send() on error</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/513">Fix comment style in ares_data.h</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/512">Remove unneeded ifdef for Windows</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/510">Fix typo in ares_init_options.3</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/509">Re-add support for Watcom compiler</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/507">Sync ax_pthread.m4 with upstream</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/502">Windows: Invalid stack variable used out of scope for HOSTS path</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/505">Sync ax_cxx_compile_stdcxx_11.m4 with upstream to fix uclibc support</a>
</ul>

<p>
<a name="1_19_0"></a>
SUBTITLE(c-ares version 1.19.0 - Jan 28 2023)
<p> Security:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/497">Low. Stack overflow in ares_set_sortlist() which is used during c-ares
   initialization and typically provided by an administrator and not an
   end user.</a>
</ul>

<p> Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/445">Windows: Drop support for XP and derivatives which greatly cleans up
   initialization code.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/465">Add ARES_OPT_HOSTS_FILE similar to ARES_OPT_RESOLVCONF for specifying a
   custom hosts file location.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/478">Add vcpkg installation instructions</a>
</ul>
<p> Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/436">Fix cross-compilation from Windows to Linux due to CPACK logic.</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/439">Fix memory leak in reading /etc/hosts when using localhost fallback.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/451">Fix chain building c-ares when libresolv is already included by another
   project</a>
 <li> File lookup should not immediately abort as there may be other tries due to
   search criteria.
 <li> <a href="https://github.com/c-ares/c-ares/issues/457">Asterisks should be allowed in host validation as CNAMEs may reference
   wildcard domains</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/459">AutoTools build system referenced bad STDC_HEADERS macro</a>
 <li> Even if one address class returns a failure for ares_getaddrinfo() we should
   still return the results we have
 <li> <a href="https://github.com/c-ares/c-ares/issues/460">CMake Windows: DLLs did not include resource file to include versions</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/464">CMake: Guard target creation in exported config</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/469">Fix ares_getaddrinfo() numerical address resolution with AF_UNSPEC</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/467">Apple: fix libresolv configured query times.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/479">Fix tools and help information</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/490">Various documentation fixes and cleanups</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/491">Add include guards to ares_data.h</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/489">c-ares could try to exceed maximum number of iovec entries supported by
   system</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/486">CMake package config generation allow for absolute install paths</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/485">Intel compiler fixes</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/492">ares_strsplit bugs</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/477">The RFC6761 6.3 states localhost subdomains must be offline too.</a>
 </ul>

<p>
<a name="1_18_1"></a>
SUBTITLE(c-ares version 1.18.1 - Oct 27 2021)
<p> Bug fixes:
<ul>
 BGF ares_getaddrinfo() would return ai_addrlen of 16 for ipv6 adddresses rather than the sizeof(struct sockaddr_in6)
</ul>

<p>
<a name="1_18_0"></a>
SUBTITLE(c-ares version 1.18.0 - Oct 25 2021)
<p> Changes:
<ul class="Changes">
 CHG <a href="https://github.com/c-ares/c-ares/pull/411">Add support for URI(Uniform Resource Identifier) records via ares_parse_uri_reply()</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/417">Provide ares_nameser.h as a public interface as needed by NodeJS</a>
 CHG <a href="https://github.com/c-ares/c-ares/issues/423">Update URLs from c-ares.haxx.se to c-ares.org</a>
 CHG <a href="https://github.com/c-ares/c-ares/issues/426">During a domain search, treat ARES_ENODATA as ARES_NXDOMAIN so that the search process will continue to the next domain in the search.</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/428">Turn ares_gethostbyname() into a wrapper for ares_getaddrinfo() as they followed very similar code paths and ares_gethostbyaddr() has some more desirable features such as priority sorting and parallel queries for AF_UNSPEC.</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/428">ares_getaddrinfo() now contains a name element in the address info structure as the last element. This is not an API or ABI break due to the structure always being internally allocated and it being the last element.</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/428">ares_parse_a_reply() and ares_parse_aaaa_reply() were nearly identical, those now use the same helper functions for parsing rather than having their own code.</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/430">RFC6761 Section 6.3 says &quot;localhost&quot; lookups need to be special cased to return loopback addresses, and not forward queries to recursive dns servers. On Windows this now returns all loopback addresses, on other systems it returns 127.0.0.1 or ::1 always, and will never forward a request for &quot;localhost&quot; to outside DNS servers.</a>
 CHG <a href="https://github.com/c-ares/c-ares/pull/431">Haiki: port</a>
</ul>
<p> Bug fixes:
<ul class="Bug fixes">
 BGF <a href="https://github.com/c-ares/c-ares/pull/410">add build to .gitignore</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/414">z/OS minor update, add missing semicolon in ares_init.c</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/418">Fix building when latest ax_code_coverage.m4 is imported</a>
 BGF <a href="">Work around autotools &apos;error: too many loops&apos; and other newer autotools    import related bugs.</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/420">MinGW cross builds need advapi32 link as lower case</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/422">Cygwin build fix due to containing both socket.h and winsock2.h</a>
 BGF <a href="https://github.com/c-ares/c-ares/issues/424">ares_expand_name should allow underscores (_) as SRV records legitimately use them</a>
 BGF <a href="https://github.com/c-ares/c-ares/issues/427">Allow &apos;/&apos; as a valid character for a returned name for CNAME in-addr.arpa delegation</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/428">ares_getaddrinfo() was not honoring HOSTALIASES</a>
 BGF <a href="https://github.com/c-ares/c-ares/pull/428">ares_getaddrinfo() had some test cases disabled due to a bug in the test framework itself which has now been resolved</a>
</ul>

<p>
<a name="1_17_2"></a>
SUBTITLE(c-ares version 1.17.2 - Aug 10 2021)
<p>
Security:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/392">NodeJS passes NULL for addr and 0 for addrlen to ares_parse_ptr_reply() on
   systems where malloc(0) returns NULL.  This would cause a crash.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/397">When building c-ares with CMake, the RANDOM_FILE would not be set and
   therefore downgrade to the less secure random number generator</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/df94703">If ares_getaddrinfo() was terminated by an ares_destroy(), it would cause
   a crash</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/400">Crash in sortaddrinfo() if the list size equals 0 due to an unexpected
   DNS response</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/362f91d">Expand number of escaped characters in DNS replies as per RFC1035 5.1 to
   prevent spoofing</a> <a href="https://github.com/c-ares/c-ares/commit/44c009b">follow-up</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/c9b6c60">Perform validation on hostnames to prevent possible XSS due to applications
   not performing valiation themselves</a>
</ul>

Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/391">Use non-blocking /dev/urandom for random data to prevent early startup
   performance issues</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/390">z/OS port</a>
 <li> <a href="https://github.com/c-ares/c-ares/commit/485fb66">ares_malloc(0) is now defined behavior (returns NULL) rather than
   system-specific to catch edge cases</a>
</ul>
Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/379">Fuzz testing files were not distributed with official archives</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/380">Building tests should not force building of static libraries except on
   Windows</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/384">Windows builds of the tools would fail if built as static due to a missing
   CARES_STATICLIB definition</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/386">Relative headers must use double quotes to prevent pulling in a system
   library</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/388">Fix OpenBSD building by implementing portability updates for including
   arpa/nameser.h</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/394">Fix building out-of-tree for autotools</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/395">Make install on MacOS/iOS with CMake was missing the bundle destination so
   libraries weren't actually installed</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/401">Fix retrieving DNS server configuration on MacOS and iOS if the configuration
   did not include search domains</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/408">ares_parse_a_reply and ares_parse_aaa_reply were erroneously using strdup()
   instead of ares_strdup()</a>
</ul>

<p>
<a name="1_17_1"></a>
SUBTITLE(c-ares version 1.17.1 - Nov 19 2020)
<p>
 Fixes packaging issues in 1.17.0.

<p>
<a name="1_17_0"></a>
SUBTITLE(c-ares version 1.17.0 - Nov 16 2020)
<p>
Security:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/333">avoid read-heap-buffer-overflow in ares_parse_soa_reply found during fuzzing</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/336">Avoid theoretical buffer overflow in RC4 loop comparison</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/367">Empty hquery->name could lead to invalid memory access</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/371">ares_parse_{a,aaaa}_reply() could return a larger *naddrttls than was passed in</a>
</ul>
Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/334">Update help information for adig, acountry, and ahost</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/346">Test Suite now uses dynamic system-assigned ports rather than hardcoded ports to prevent failures in containers</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/244">Detect remote DNS server does not support EDNS using rules from RFC 6891</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/349">Source tree has been reorganized to use a more modern layout</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/360">Allow parsing of CAA Resource Record</a>
</ul>
<p>
  Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/331">readaddrinfo bad sizeof()</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/344">Test cases should honor HAVE_WRITEV flag, not depend on WIN32</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/345">FQDN with trailing period should be queried first</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/317">ares_getaddrinfo() was returning members of the struct as garbage values if unset, and was not honoring ai_socktype and ai_protocol hints.</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/204">ares_gethostbyname() with AF_UNSPEC and an ip address would fail</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/368">Properly document ares_set_local_ip4() uses host byte order</a>
</ul>

<p>
<a name="1_16_1"></a>
SUBTITLE(c-ares version 1.16.1 - May 11 2020)
<p>
Security:
<ul>
 <li> Prevent possible use-after-free and double-free in ares_getaddrinfo() if
   ares_destroy() is called prior to ares_getaddrinfo() completing.  Reported
   by Jann Horn at Google Project Zero.
</ul>
<p>
Changes:
<ul>
 <li> Allow TXT records on CHAOS qclass.  Used for retriving things like
   version.bind, version.server, authoris.bind, hostname.bind, and id.server.
   [3]
</ul>
<p>
  Bug fixes:
<ul>
 <li> Fix Windows Unicode incompatibilities with ares_getaddrinfo() [1]
 <li> Silence false cast-align compiler warnings due to valid casts of
   struct sockaddr to struct sockaddr_in and struct sockaddr_in6.
 <li> MacOS should use libresolv for retrieving DNS servers, like iOS
 <li> CMake build system should populate the INCLUDE_DIRECTORIES property of 
   installed targets [2]
 <li> Correct macros in use for the ares_getaddrinfo.3 man page
</ul>
 
<p>
<a name="1_16_0"></a>
SUBTITLE(c-ares version 1.16.0 - March 13 2020)
<p>
Changes:
<ul>
 <li> Introduction of ares_getaddrinfo() API which provides similar output 
   (including proper sorting as per RFC 6724) to the system native API, but
   utilizes different data structures in order to provide additional information
   such as TTLs and all aliases.  Please reference the respective man pages for
   usage details.
 <li> Parse SOA records from ns_t_any response
 <li> CMake: Provide c-ares version in package export file
 <li> CMake: Add CPACK functionality for DEB and RPM
 <li> CMake: Generate PDB files during build
 <li> CMake: Support manpage installation
</ul>
<p>
Bug fixes:
<ul>
 <li> Fix bad expectation in IPv6 localhost test.
 <li> AutoTools: use XC_CHECK_BUILD_FLAGS instead of XC_CHECK_USER_FLAGS to prevent
   complaints about CPPFLAGS in CFLAGS.
 <li> Fix .onion handling
 <li> Command line usage was out of date for adig and ahost.
 <li> Typos in manpages
 <li> If ares_getenv is defined, it must return a value on all platforms
 <li> If /etc/resolv.conf has invalid lookup values, use the defaults.
 <li> Tests: Separate live tests from SetServers* tests as only live tests should require internet access.
 <li> ares_gethostbyname() should return ENODATA if no valid A or AAAA record is found, but a CNAME was found.
 <li> CMake: Rework library function checking to prevent unintended linking with
   system libraries that aren't needed.
 <li> Due to use of inet_addr() it was not possible to return 255.255.255.255 from ares_gethostbyname().
 <li> CMake: Fix building of tests on Windows
</ul>

<a name="1_15_0"></a>
SUBTITLE(c-ares version 1.15.0 - October 23 2018)
<p>
Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/220">Add ares_init_options() configurability for path to resolv.conf file</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/200">Ability to exclude building of tools (adig, ahost, acountry) in CMake</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/207">Android: Support for domain search suffix</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/196">Report ARES_ENOTFOUND for .onion domain names as per RFC7686</a>
</ul>

<p>
Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/issues/224">AIX build fix for trying to include both nameser_compat.h and onameser_compat.h</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/202">Windows: Improve DNS suffixes extracting from WinNT registry</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/201">Fix modern GCC warnings</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/193">Apply the IPv6 server blacklist to all nameserver sources, not just Windows</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/192">Fix warnings emitted by MSVC when using -W4</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/191">Prevent changing name servers while queries are outstanding</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/187">Harden and rationalize c-ares timeout computation</a>
 <li> <a href="https://c-ares.org/mail/c-ares-archive-2018-04/0000.shtml">Distribute ares_android.h</a>
 <li> <a href="https://c-ares.org/mail/c-ares-archive-2018-03/0000.shtml">ares_set_servers_csv() on failure should not leave channel in a bad state</a>
 <li> Add missing docs to distribution
</ul>

<p>
<a name="1_14_0"></a>
SUBTITLE(c-ares version 1.14.0 - February 16 2018)
<p>
Changes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/pull/148">android: Introduce new ares_library_init_android() call for Oreo support</a>
</ul>

<p>
Bug fixes:
<ul>
 <li> <a href="https://github.com/c-ares/c-ares/commit/18ea99">Fix patch for CVE-2017-1000381 to not be overly aggressive</a>
 <li> <a href="https://github.com/c-ares/c-ares/issues/150">win32: Preserve DNS server order returned by Windows when sorting and exclude DNS servers in legacy subnets</a>
 <li> win32: Support most recent Visual Studio 2017
 <li> <a href="https://github.com/c-ares/c-ares/pull/138">gethostbyaddr should fail with ECANCELLED not ENOTFOUND when ares_cancel is called</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/144">win32: Exclude legacy ipv6 subnets</a>
 <li> <a href=https://github.com/c-ares/c-ares/pull/175"">android: Applications compiled for Oreo can no longer use __system_property_get and must use Java calls to retrieve DNS servers</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/142">win32: Force use of ANSI functions</a>
 <li> CMake minimum version is now 3.1
 <li> <a href="https://c-ares.org/mail/c-ares-archive-2011-06/0012.shtml">ares_gethostbyname.3: fix callback status values</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/180">docs: Document WSAStartup requirement</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/160">Fix a typo in init_by_resolv_conf</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/175">Android JNI code leaks local references in some cases</a>
 <li> <a href="https://github.com/c-ares/c-ares/pull/142">Force using the ANSI versions of WinAPI functions</a>
</ul>
<p>
<a name="1_13_0"></a>
SUBTITLE(c-ares version 1.13.0 - June 20 2017)
<p>
Changes:
<ul>
 <li> cmake build system support added
 <li> Add virtual function set for socket IO: ares_set_socket_functions
</ul>
<p>
Bug fixes:
<ul>
 <li> <a href="https://c-ares.org/adv_20170620.html">CVE-2017-1000381: c-ares NAPTR parser out of bounds access</a>
 <li> macos: do not set HAVE_CLOCK_GETTIME_MONOTONIC
 <li> test: check ares_create_query with too-long name
 <li> dist: add ares_library_initialized.* to the tarball
 <li> fix build on OpenBSD
 <li> dist: ship msvc_ver.inc too
 <li> test: Add gTest/gMock files to SOURCES
 <li> test: add fuzz entrypoint for ares_create_query()
 <li> configure: clock_gettime workaround
 <li> docs: convert INSTALL to MarkDown & tweak
 <li> ares_process: fix return type of socket_create function (win32 warning)
 <li> docs: fixed references to ares_set_local_ip4 and ares_set_local_ip6
 <li> Windows DNS server sorting
 <li> Use ares_socklen_t instead of socket_t
 <li> ares_create_query: use ares_free not naked free
 <li> msvc_ver.inc support most recent Visual Studio 2017
 <li> acountry: Convert char from ISO-8859-1 to UTF-8
 <li> ares_expand_name: limit number of indirections
 <li> configure: do not check for ar if specified manually
 <li> Added support for Windows DNS Suffix Search List
 <li> ares.h: support compiling with QNX
</ul>
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
 <li> <a href="https://c-ares.org/adv_20160929.html">CVE-2016-5180: ares_create_query single byte out of buffer write</a>
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
