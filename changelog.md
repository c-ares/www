<a name="1_25_0"></a>
## c-ares version 1.25.0 - Jan 3 2024

Changes:

* [AutoTools: rewrite build system to be lighter weight and fix issues in some semi-modern systems. It is likely this has broken building on some less common and legacy OSs, please report issues. ](https://github.com/c-ares/c-ares/pull/674)
* [Rewrite ares\_strsplit() as a wrapper for ares\_\_buf\_split() for memory safety reasons.](https://github.com/c-ares/c-ares/commit/88c444d)
* [The ahost utility now uses ares\_getaddrinfo() and returns both IPv4 and IPv6 addresses by default.](https://github.com/c-ares/c-ares/pull/669)
* [OpenBSD: Add SOCK\_DNS flag when creating socket.](https://github.com/c-ares/c-ares/pull/659)

Bugfixes:

* [Tests: Live reverse lookups for Google's public DNS servers no longer return results, replace with CloudFlare pubic DNS servers.](https://github.com/c-ares/c-ares/commit/1231aa7)
* [MacOS legacy SDKs require sys/socket.h before net/if.h](https://github.com/c-ares/c-ares/pull/673)
* [Connection failures should increment the server failure count first or a retry might be enqueued to the same server.](https://github.com/c-ares/c-ares/commit/05181a6)
* [On systems that don't implement the ability to enumerate network interfaces the stubs used the wrong prototype.](https://github.com/c-ares/c-ares/commit/eebfe0c)
* [Fix minor warnings and documentation typos.](https://github.com/c-ares/c-ares/pull/666)
* [Fix support for older GoogleTest versions.](https://github.com/c-ares/c-ares/commit/d186f11)
* [getrandom() may require sys/random.h on some systems.](https://github.com/c-ares/c-ares/issues/665)
* [Fix building tests with symbol hiding enabled.](https://github.com/c-ares/c-ares/issues/664)


<a name="1_24_0"></a>
## c-ares version 1.24.0 - Dec 17 2023

Features:

* [Add support for IPv6 link-local DNS servers. Nameserver formats can nowaccept the %iface suffix, and a new ares\_get\_servers\_csv() function was added to return servers that can contain the link-local interface name. ](https://github.com/c-ares/c-ares/pull/646)

Changes:

* [Unbundle GoogleTest for test cases. Package maintainers will now need to require GoogleTest (GMock) as a build dependency if building tests. New GoogleTest versions require C++14 or later. ](https://github.com/c-ares/c-ares/pull/655)
* [Replace nameserver parsing code to use new memory-safe functions.](https://github.com/c-ares/c-ares/pull/643)
* [Replace the sortlist parser with new memory-safe functions.](https://github.com/c-ares/c-ares/pull/653)
* Various warning fixes and dead code removal.

Bugfixes:

* [Old Linux versions require POSIX\_C\_SOURCE or \_GNU\_SOURCE to compile with thread safety support. ](https://github.com/c-ares/c-ares/issues/644)
* [A non-responsive DNS server that caused timeouts wouldn't increment the failure count, this would lead to other servers not being tried. Regression introduced in 1.22.0. ](https://github.com/c-ares/c-ares/pull/650)
* [Some projects that depend on c-ares expect invalid parameter option values passed into ares\_init\_options() to simply be ignored. This behavior has been restored. ](https://github.com/c-ares/c-ares/commit/c982bf4)
* [On linux getrandom() can fail if the kernel doesn't support the syscall, fall back to another random source. ](https://github.com/c-ares/c-ares/pull/661)
* [ares\_cancel() when performing ares\_gethostbyname() or ares\_getaddrinfo() with AF\_UNSPEC, if called after one address class was returned but before the other address class, it would return ARES\_SUCCESS rather than ARES\_ECANCELLED. ](https://github.com/c-ares/c-ares/pull/663)


<a name="1_23_0"></a>
## c-ares version 1.23.0 - Nov 30 2023

Features:

* [Introduce optional (but on by default) thread-safety for the c-ares library. This has no API nor ABI implications. ](https://github.com/c-ares/c-ares/pull/636)
* [resolv.conf in modern systems uses attempts and timeouts options instead of the old retrans and retry options. ](https://github.com/c-ares/c-ares/pull/632)
* [Query caching support based on TTL of responses. Can be enabled via ares\_init\_options() with ARES\_OPT\_QUERY\_CACHE. ](https://github.com/c-ares/c-ares/pull/625)

Bugfixes:

* [ares\_init\_options() for ARES\_OPT\_UDP\_PORT and ARES\_OPT\_TCP\_PORT accept the port in host byte order, but it was reading it as network byte order. Regression introduced in 1.20.0. ](https://github.com/c-ares/c-ares/commit/fb52c3f)
* [ares\_init\_options() for ARES\_FLAG\_NOSEARCH was not being honored for ares\_getaddrinfo() or ares\_gethostbyname(). Regression introduced in 1.16.0. ](https://github.com/c-ares/c-ares/pull/638)
* [Autotools MacOS and iOS version check was failing](https://github.com/c-ares/c-ares/commit/f4d8c9a)
* [Environment variables passed to c-ares are meant to be an override for system configuration. Regression introduced in 1.22.0. ](https://github.com/c-ares/c-ares/commit/b674abd)
* [Spelling fixes as detected by codespell.](https://github.com/c-ares/c-ares/pull/634)
* [The timeout returned by ares\_timeout() was truncated to milliseconds but validated to microseconds which could cause a user to attempt to process timeouts prior to the timeout actually expiring. ](https://github.com/c-ares/c-ares/pull/633)
* [CMake was not honoring CXXFLAGS passed in via the environment which could cause compile and link errors with distribution hardening flags during packaging. ](https://github.com/c-ares/c-ares/commit/33ee6c0)
* [Fix Windows UWP and Cygwin compilation.](https://github.com/c-ares/c-ares/pull/627)
* [ares\_set\_servers\_\*() for legacy reasons needs to accept an empty server listand zero out all servers. This results in an inoperable channel and thus is only used in simulation testing, but we don't want to break users. Regression introduced in 1.21.0. ](https://github.com/c-ares/c-ares/commit/320cefe)


<a name="1_22_1"></a>
## c-ares version 1.22.1 - Nov 19 2023

Bugfixes:

* [Fix /etc/hosts processing performance with all entries using same IPaddress. Large hosts files using the same IP address for all entries could use exponential time. ](https://github.com/c-ares/c-ares/commit/a36317)
* [Fix typos in manpages](https://github.com/c-ares/c-ares/pull/619)
* [Fix OpenWatcom building](https://github.com/c-ares/c-ares/pull/623)


<a name="1_22_0"></a>
## c-ares version 1.22.0 - Nov 14 2023

Features:

* [ares\_reinit() is now implemented to re-read any system configuration and immediately apply to an existing ares channel ](https://github.com/c-ares/c-ares/pull/614)
* [The adig command line program has been rewritten and its format now more closely matches that of BIND's dig utility ](https://github.com/c-ares/c-ares/pull/607)
* [The new DNS message parser and writer functions have now been made public](https://github.com/c-ares/c-ares/pull/604)
* [RFC9460 HTTPS and SVCB records are now supported](https://github.com/c-ares/c-ares/pull/603)
* [RFC6698 TLSA records are now supported](https://github.com/c-ares/c-ares/pull/600)
* [The server list is now internally dynamic and can be changed without impacting existing queries ](https://github.com/c-ares/c-ares/pull/594)
* [Hosts file processing is now cached until the file is detected to be changed to speed up repetitive lookups of large hosts files ](https://github.com/c-ares/c-ares/pull/591)

Changes:

* [Internally all DNS messages are now written using the new DNS writing functions ](https://github.com/c-ares/c-ares/pull/598)
* [EDNS is now enabled by default](https://github.com/c-ares/c-ares/pull/596)
* [Internal cleanups in function prototypes](https://github.com/c-ares/c-ares/pull/595)

Bugfixes:

* [Randomize retry penalties to prevent thundering herd issues when dns servers throttle requests ](https://github.com/c-ares/c-ares/pull/606)
* [Fix Windows build error for missing if\_indextoname()](https://github.com/c-ares/c-ares/pull/594)


<a name="1_21_0"></a>
## c-ares version 1.21.0 - Oct 27 2023

Changes:

* [Provide better man page cross-links.](https://github.com/c-ares/c-ares/pull/565)
* [Introduce ares\_status\_t as an enum rather than using \#define list and integer data type for internal functions.](https://github.com/c-ares/c-ares/pull/567)
* [Introduce ares\_bool\_t datatype rather than using an integer with 0/1 so it is clear based on the function prototype what it returns.](https://github.com/c-ares/c-ares/pull/570)
* [Increase compiler warning levels by default.](https://github.com/c-ares/c-ares/pull/568)
* [Use size\_t and other more proper datatypes internally (rather than int).](https://github.com/c-ares/c-ares/pull/573)
* [Many developers have used different code styles over the years, standardize on one and use clang-format to enforce the style.](https://github.com/c-ares/c-ares/pull/579)
* [CMake can now control symbol visibility](https://github.com/c-ares/c-ares/pull/574)
* [Replace multiple DNS hand-made parsers with new memory-safe DNS message parser.](https://github.com/c-ares/c-ares/pull/581)

Bugfixes:

* [Tools: STAYOPEN flag could make tools not terminate.](https://github.com/c-ares/c-ares/pull/569)
* [Socket callbacks were passed SOCK\_STREAM instead of SOCK\_DGRAM on udp.](https://github.com/c-ares/c-ares/commit/a070d78)


<a name="1_20_1"></a>
## c-ares version 1.20.1 - Oct 8 2023

Bugfixes:

* [Resolve use-after-free issue when TCP connection is terminated before a response is returned](https://github.com/c-ares/c-ares/pull/562)
* Reduce number of queries for a load test case to prevent overloading some build systems
* [Fix fuzz test build target](https://github.com/c-ares/c-ares/pull/559)


<a name="1_20_0"></a>
## c-ares version 1.20.0 - Oct 7 2023

Changes:

* [Update from 1989 MIT license text to modern MIT license text](https://github.com/c-ares/c-ares/pull/556)
* [Remove acountry from built tools as nerd.dk is gone](https://github.com/c-ares/c-ares/pull/554)
* [Add new ARES\_OPT\_UDP\_MAX\_QUERIES configuration option to limit the number of queries that can be made from a single ephemeral port](https://github.com/c-ares/c-ares/pull/549)
* [Default per-query timeout has been reduced to 2s with a 3x retry count](https://github.com/c-ares/c-ares/pull/542)
* [Modernization: start implementing some common data structures that are easy to use and hard to misuse. This will make code refactoring easier and remove some varied implementations in use. This change also makes ares\_timeout() more efficient](https://github.com/c-ares/c-ares/pull/540)
* [Use SPDX identifiers and a REUSE CI job to verify](https://github.com/c-ares/c-ares/commit/c1b00c41)
* [rand: add support for getrandom()](https://github.com/c-ares/c-ares/pull/526)

Bug fixes:

* [TCP back to back queries were broken](https://github.com/c-ares/c-ares/pull/552)
* [Ensure queries for ares\_getaddrinfo() are not requeued during destruction](https://github.com/c-ares/c-ares/pull/553)
* [ares\_getaddrinfo() should not retry other address classes if one address class has already been returned](https://github.com/c-ares/c-ares/pull/551)
* [Avoid production ill-formed result when qualifying a name with the root domain](https://github.com/c-ares/c-ares/pull/546)
* [Fix missing prefix for CMake generated libcares.pc](https://github.com/c-ares/c-ares/pull/530)
* [DNS server ports will now be read from system configuration instead of defaulting to port 53](https://github.com/c-ares/c-ares/pull/534)
* [Remove some unreachable code](https://github.com/c-ares/c-ares/pull/527)
* [Replace usages of sprintf with snprintf](https://github.com/c-ares/c-ares/pull/525)
* [Fix Watcom instructions and update Windows URLs](https://github.com/c-ares/c-ares/pull/524)


<a name="1_19_1"></a>
## c-ares version 1.19.1 - May 22 2023

Security:

* [CVE-2023-32067](https://github.com/c-ares/c-ares/security/advisories/GHSA-9g78-jv2r-p7vc). High. 0-byte UDP payload causes Denial of Service
* [CVE-2023-31147](https://github.com/c-ares/c-ares/security/advisories/GHSA-8r8p-23f3-64c2) Moderate. Insufficient randomness in generation of DNS query IDs
* [CVE-2023-31130](https://github.com/c-ares/c-ares/security/advisories/GHSA-x6mf-cxr9-8q6v). Moderate. Buffer Underwrite in ares\_inet\_net\_pton()
* [CVE-2023-31124](https://github.com/c-ares/c-ares/security/advisories/GHSA-54xr-f67r-4pc4). Low. AutoTools does not set CARES\_RANDOM\_FILE during cross compilation

Bug fixes:

* [Fix uninitialized memory warning in test](https://github.com/c-ares/c-ares/pull/515)
* [Turn off IPV6\_V6ONLY on Windows to allow IPv4-mapped IPv6 addresses](https://github.com/c-ares/c-ares/pull/520)
* [ares\_getaddrinfo() should allow a port of 0](https://github.com/c-ares/c-ares/issues/517)
* [Fix memory leak in ares\_send() on error](https://github.com/c-ares/c-ares/pull/511)
* [Fix comment style in ares\_data.h](https://github.com/c-ares/c-ares/pull/513)
* [Remove unneeded ifdef for Windows](https://github.com/c-ares/c-ares/pull/512)
* [Fix typo in ares\_init\_options.3](https://github.com/c-ares/c-ares/pull/510)
* [Re-add support for Watcom compiler](https://github.com/c-ares/c-ares/pull/509)
* [Sync ax\_pthread.m4 with upstream](https://github.com/c-ares/c-ares/pull/507)
* [Windows: Invalid stack variable used out of scope for HOSTS path](https://github.com/c-ares/c-ares/pull/502)
* [Sync ax\_cxx\_compile\_stdcxx\_11.m4 with upstream to fix uclibc support](https://github.com/c-ares/c-ares/pull/505)


<a name="1_19_0"></a>
## c-ares version 1.19.0 - Jan 28 2023

Security:

* [Low. Stack overflow in ares\_set\_sortlist() which is used during c-ares initialization and typically provided by an administrator and not an end user.](https://github.com/c-ares/c-ares/pull/497)

Changes:

* [Windows: Drop support for XP and derivatives which greatly cleans up initialization code.](https://github.com/c-ares/c-ares/pull/445)
* [Add ARES\_OPT\_HOSTS\_FILE similar to ARES\_OPT\_RESOLVCONF for specifying a custom hosts file location.](https://github.com/c-ares/c-ares/pull/465)
* [Add vcpkg installation instructions](https://github.com/c-ares/c-ares/pull/478)

Bug fixes:

* [Fix cross-compilation from Windows to Linux due to CPACK logic.](https://github.com/c-ares/c-ares/pull/436)
* [Fix memory leak in reading /etc/hosts when using localhost fallback.](https://github.com/c-ares/c-ares/issues/439)
* [Fix chain building c-ares when libresolv is already included by another project](https://github.com/c-ares/c-ares/pull/451)
* File lookup should not immediately abort as there may be other tries due to search criteria.
* [Asterisks should be allowed in host validation as CNAMEs may reference wildcard domains](https://github.com/c-ares/c-ares/issues/457)
* [AutoTools build system referenced bad STDC\_HEADERS macro](https://github.com/c-ares/c-ares/pull/459)
* Even if one address class returns a failure for ares\_getaddrinfo() we should still return the results we have
* [CMake Windows: DLLs did not include resource file to include versions](https://github.com/c-ares/c-ares/issues/460)
* [CMake: Guard target creation in exported config](https://github.com/c-ares/c-ares/pull/464)
* [Fix ares\_getaddrinfo() numerical address resolution with AF\_UNSPEC](https://github.com/c-ares/c-ares/pull/469)
* [Apple: fix libresolv configured query times.](https://github.com/c-ares/c-ares/pull/467)
* [Fix tools and help information](https://github.com/c-ares/c-ares/pull/479)
* [Various documentation fixes and cleanups](https://github.com/c-ares/c-ares/pull/490)
* [Add include guards to ares\_data.h](https://github.com/c-ares/c-ares/pull/491)
* [c-ares could try to exceed maximum number of iovec entries supported by system](https://github.com/c-ares/c-ares/pull/489)
* [CMake package config generation allow for absolute install paths](https://github.com/c-ares/c-ares/pull/486)
* [Intel compiler fixes](https://github.com/c-ares/c-ares/pull/485)
* [ares\_strsplit bugs](https://github.com/c-ares/c-ares/pull/492)
* [The RFC6761 6.3 states localhost subdomains must be offline too.](https://github.com/c-ares/c-ares/issues/477)


<a name="1_18_1"></a>
## c-ares version 1.18.1 - Oct 27 2021

Bug fixes:

* ares\_getaddrinfo() would return ai\_addrlen of 16 for ipv6 adddresses rather than the sizeof(struct sockaddr\_in6)


<a name="1_18_0"></a>
## c-ares version 1.18.0 - Oct 25 2021

Changes:

* [Add support for URI(Uniform Resource Identifier) records via ares\_parse\_uri\_reply()](https://github.com/c-ares/c-ares/pull/411)
* [Provide ares\_nameser.h as a public interface as needed by NodeJS](https://github.com/c-ares/c-ares/pull/417)
* [Update URLs from c-ares.haxx.se to c-ares.org](https://github.com/c-ares/c-ares/issues/423)
* [During a domain search, treat ARES\_ENODATA as ARES\_NXDOMAIN so that the search process will continue to the next domain in the search.](https://github.com/c-ares/c-ares/issues/426)
* [Turn ares\_gethostbyname() into a wrapper for ares\_getaddrinfo() as they followed very similar code paths and ares\_gethostbyaddr() has some more desirable features such as priority sorting and parallel queries for AF\_UNSPEC.](https://github.com/c-ares/c-ares/pull/428)
* [ares\_getaddrinfo() now contains a name element in the address info structure as the last element. This is not an API or ABI break due to the structure always being internally allocated and it being the last element.](https://github.com/c-ares/c-ares/pull/428)
* [ares\_parse\_a\_reply() and ares\_parse\_aaaa\_reply() were nearly identical, those now use the same helper functions for parsing rather than having their own code.](https://github.com/c-ares/c-ares/pull/428)
* [RFC6761 Section 6.3 says "localhost" lookups need to be special cased to return loopback addresses, and not forward queries to recursive dns servers. On Windows this now returns all loopback addresses, on other systems it returns 127.0.0.1 or ::1 always, and will never forward a request for "localhost" to outside DNS servers.](https://github.com/c-ares/c-ares/pull/430)
* [Haiku: port](https://github.com/c-ares/c-ares/pull/431)

Bug fixes:

* [add build to .gitignore](https://github.com/c-ares/c-ares/pull/410)
* [z/OS minor update, add missing semicolon in ares_init.c](https://github.com/c-ares/c-ares/pull/414)
* [Fix building when latest ax\_code\_coverage.m4 is imported](https://github.com/c-ares/c-ares/pull/418)
* [Work around autotools 'error: too many loops' and other newer autotools import related bugs.]()
* [MinGW cross builds need advapi32 link as lower case](https://github.com/c-ares/c-ares/pull/420)
* [Cygwin build fix due to containing both socket.h and winsock2.h](https://github.com/c-ares/c-ares/pull/422)
* [ares\_expand\_name should allow underscores (\_) as SRV records legitimately use them](https://github.com/c-ares/c-ares/issues/424)
* [Allow '/' as a valid character for a returned name for CNAME in-addr.arpa delegation](https://github.com/c-ares/c-ares/issues/427)
* [ares\_getaddrinfo() was not honoring HOSTALIASES](https://github.com/c-ares/c-ares/pull/428)
* [ares\_getaddrinfo() had some test cases disabled due to a bug in the test framework itself which has now been resolved](https://github.com/c-ares/c-ares/pull/428)


<a name="1_17_2"></a>
## c-ares version 1.17.2 - Aug 10 2021

Security:

* [NodeJS passes NULL for addr and 0 for addrlen to ares\_parse\_ptr\_reply() on systems where malloc(0) returns NULL. This would cause a crash.](https://github.com/c-ares/c-ares/issues/392)
* [When building c-ares with CMake, the RANDOM\_FILE would not be set and therefore downgrade to the less secure random number generator](https://github.com/c-ares/c-ares/pull/397)
* [If ares\_getaddrinfo() was terminated by an ares\_destroy(), it would cause a crash](https://github.com/c-ares/c-ares/commit/df94703)
* [Crash in sortaddrinfo() if the list size equals 0 due to an unexpected DNS response](https://github.com/c-ares/c-ares/pull/400)
* [Expand number of escaped characters in DNS replies as per RFC1035 5.1 to prevent spoofing](https://github.com/c-ares/c-ares/commit/362f91d) [follow-up](https://github.com/c-ares/c-ares/commit/44c009b)
* [Perform validation on hostnames to prevent possible XSS due to applications not performing valiation themselves](https://github.com/c-ares/c-ares/commit/c9b6c60)

Changes:

* [Use non-blocking /dev/urandom for random data to prevent early startup performance issues](https://github.com/c-ares/c-ares/pull/391)
* [z/OS port](https://github.com/c-ares/c-ares/pull/390)
* [ares\_malloc(0) is now defined behavior (returns NULL) rather than system-specific to catch edge cases](https://github.com/c-ares/c-ares/commit/485fb66)

Bug fixes:

* [Fuzz testing files were not distributed with official archives](https://github.com/c-ares/c-ares/issues/379)
* [Building tests should not force building of static libraries except on Windows](https://github.com/c-ares/c-ares/issues/380)
* [Windows builds of the tools would fail if built as static due to a missing CARES\_STATICLIB definition](https://github.com/c-ares/c-ares/issues/384)
* [Relative headers must use double quotes to prevent pulling in a system library](https://github.com/c-ares/c-ares/pull/386)
* [Fix OpenBSD building by implementing portability updates for including arpa/nameser.h](https://github.com/c-ares/c-ares/issues/388)
* [Fix building out-of-tree for autotools](https://github.com/c-ares/c-ares/pull/394)
* [Make install on MacOS/iOS with CMake was missing the bundle destination so libraries weren't actually installed](https://github.com/c-ares/c-ares/pull/395)
* [Fix retrieving DNS server configuration on MacOS and iOS if the configuration did not include search domains](https://github.com/c-ares/c-ares/pull/401)
* [ares\_parse\_a\_reply and ares\_parse\_aaa\_reply were erroneously using strdup() instead of ares\_strdup()](https://github.com/c-ares/c-ares/pull/408)


<a name="1_17_1"></a>
## c-ares version 1.17.1 - Nov 19 2020

Fixes packaging issues in 1.17.0.


<a name="1_17_0"></a>
## c-ares version 1.17.0 - Nov 16 2020

Security:

* [avoid read-heap-buffer-overflow in ares\_parse\_soa\_reply found during fuzzing](https://github.com/c-ares/c-ares/issues/333)
* [Avoid theoretical buffer overflow in RC4 loop comparison](https://github.com/c-ares/c-ares/pull/336)
* [Empty hquery-&gt;name could lead to invalid memory access](https://github.com/c-ares/c-ares/pull/367)
* [ares\_parse\_{a,aaaa}\_reply() could return a larger \*naddrttls than was passed in](https://github.com/c-ares/c-ares/issues/371)

Changes:

* [Update help information for adig, acountry, and ahost](https://github.com/c-ares/c-ares/pull/334)
* [Test Suite now uses dynamic system-assigned ports rather than hardcoded ports to prevent failures in containers](https://github.com/c-ares/c-ares/pull/346)
* [Detect remote DNS server does not support EDNS using rules from RFC 6891](https://github.com/c-ares/c-ares/pull/244)
* [Source tree has been reorganized to use a more modern layout](https://github.com/c-ares/c-ares/pull/349)
* [Allow parsing of CAA Resource Record](https://github.com/c-ares/c-ares/pull/360)

Bug fixes:

* [readaddrinfo bad sizeof()](https://github.com/c-ares/c-ares/pull/331)
* [Test cases should honor HAVE\_WRITEV flag, not depend on WIN32](https://github.com/c-ares/c-ares/pull/344)
* [FQDN with trailing period should be queried first](https://github.com/c-ares/c-ares/pull/345)
* [ares\_getaddrinfo() was returning members of the struct as garbage values if unset, and was not honoring ai\_socktype and ai\_protocol hints.](https://github.com/c-ares/c-ares/issues/317)
* [ares\_gethostbyname() with AF\_UNSPEC and an ip address would fail](https://github.com/c-ares/c-ares/pull/204)
* [Properly document ares\_set\_local\_ip4() uses host byte order](https://github.com/c-ares/c-ares/pull/368)


<a name="1_16_1"></a>
## c-ares version 1.16.1 - May 11 2020

Security:

* Prevent possible use-after-free and double-free in ares\_getaddrinfo() if ares\_destroy() is called prior to ares\_getaddrinfo() completing. Reported by Jann Horn at Google Project Zero.

Changes:

* Allow TXT records on CHAOS qclass. Used for retriving things like version.bind, version.server, authoris.bind, hostname.bind, and id.server. \[3\]

Bug fixes:

* Fix Windows Unicode incompatibilities with ares\_getaddrinfo() \[1\]
* Silence false cast-align compiler warnings due to valid casts of struct sockaddr to struct sockaddr\_in and struct sockaddr\_in6.
* MacOS should use libresolv for retrieving DNS servers, like iOS
* CMake build system should populate the INCLUDE\_DIRECTORIES property of installed targets \[2\]
* Correct macros in use for the ares\_getaddrinfo.3 man page


<a name="1_16_0"></a>
## c-ares version 1.16.0 - March 13 2020

Changes:

* Introduction of ares\_getaddrinfo() API which provides similar output (including proper sorting as per RFC 6724) to the system native API, but utilizes different data structures in order to provide additional information such as TTLs and all aliases. Please reference the respective man pages for usage details.
* Parse SOA records from ns\_t\_any response
* CMake: Provide c-ares version in package export file
* CMake: Add CPACK functionality for DEB and RPM
* CMake: Generate PDB files during build
* CMake: Support manpage installation

Bug fixes:

* Fix bad expectation in IPv6 localhost test.
* AutoTools: use XC\_CHECK\_BUILD\_FLAGS instead of XC\_CHECK\_USER\_FLAGS to prevent complaints about CPPFLAGS in CFLAGS.
* Fix .onion handling
* Command line usage was out of date for adig and ahost.
* Typos in manpages
* If ares\_getenv is defined, it must return a value on all platforms
* If /etc/resolv.conf has invalid lookup values, use the defaults.
* Tests: Separate live tests from SetServers\* tests as only live tests should require internet access.
* ares\_gethostbyname() should return ENODATA if no valid A or AAAA record is found, but a CNAME was found.
* CMake: Rework library function checking to prevent unintended linking with system libraries that aren't needed.
* Due to use of inet\_addr() it was not possible to return 255.255.255.255 from ares\_gethostbyname().
* CMake: Fix building of tests on Windows


<a name="1_15_0"></a>
## c-ares version 1.15.0 - October 23 2018

Changes:

* [Add ares\_init\_options() configurability for path to resolv.conf file](https://github.com/c-ares/c-ares/issues/220)
* [Ability to exclude building of tools (adig, ahost, acountry) in CMake](https://github.com/c-ares/c-ares/issues/200)
* [Android: Support for domain search suffix](https://github.com/c-ares/c-ares/issues/207)
* [Report ARES\_ENOTFOUND for .onion domain names as per RFC7686](https://github.com/c-ares/c-ares/issues/196)

Bug fixes:

* [AIX build fix for trying to include both nameser\_compat.h and onameser\_compat.h](https://github.com/c-ares/c-ares/issues/224)
* [Windows: Improve DNS suffixes extracting from WinNT registry](https://github.com/c-ares/c-ares/pull/202)
* [Fix modern GCC warnings](https://github.com/c-ares/c-ares/pull/201)
* [Apply the IPv6 server blacklist to all nameserver sources, not just Windows](https://github.com/c-ares/c-ares/pull/193)
* [Fix warnings emitted by MSVC when using -W4](https://github.com/c-ares/c-ares/pull/192)
* [Prevent changing name servers while queries are outstanding](https://github.com/c-ares/c-ares/pull/191)
* [Harden and rationalize c-ares timeout computation](https://github.com/c-ares/c-ares/pull/187)
* [Distribute ares\_android.h](https://c-ares.org/mail/c-ares-archive-2018-04/0000.shtml)
* [ares\_set\_servers\_csv() on failure should not leave channel in a bad state](https://c-ares.org/mail/c-ares-archive-2018-03/0000.shtml)
* Add missing docs to distribution


<a name="1_14_0"></a>
## c-ares version 1.14.0 - February 16 2018

Changes:

* [android: Introduce new ares\_library\_init\_android() call for Oreo support](https://github.com/c-ares/c-ares/pull/148)

Bug fixes:

* [Fix patch for CVE-2017-1000381 to not be overly aggressive](https://github.com/c-ares/c-ares/commit/18ea99)
* [win32: Preserve DNS server order returned by Windows when sorting and exclude DNS servers in legacy subnets](https://github.com/c-ares/c-ares/issues/150)
* win32: Support most recent Visual Studio 2017
* [gethostbyaddr should fail with ECANCELLED not ENOTFOUND when ares\_cancel is called](https://github.com/c-ares/c-ares/pull/138)
* [win32: Exclude legacy ipv6 subnets](https://github.com/c-ares/c-ares/pull/144)
* [android: Applications compiled for Oreo can no longer use \_\_system\_property\_get and must use Java calls to retrieve DNS servers](https://github.com/c-ares/c-ares/pull/175"")
* [win32: Force use of ANSI functions](https://github.com/c-ares/c-ares/pull/142)
* CMake minimum version is now 3.1
* [ares\_gethostbyname.3: fix callback status values](https://c-ares.org/mail/c-ares-archive-2011-06/0012.shtml)
* [docs: Document WSAStartup requirement](https://github.com/c-ares/c-ares/pull/180)
* [Fix a typo in init\_by\_resolv\_conf](https://github.com/c-ares/c-ares/pull/160)
* [Android JNI code leaks local references in some cases](https://github.com/c-ares/c-ares/pull/175)
* [Force using the ANSI versions of WinAPI functions](https://github.com/c-ares/c-ares/pull/142)


<a name="1_13_0"></a>
## c-ares version 1.13.0 - June 20 2017

Changes:

* cmake build system support added
* Add virtual function set for socket IO: ares\_set\_socket\_functions

Bug fixes:

* [CVE-2017-1000381: c-ares NAPTR parser out of bounds access](https://c-ares.org/adv_20170620.html)
* macos: do not set HAVE\_CLOCK\_GETTIME\_MONOTONIC
* test: check ares\_create\_query with too-long name
* dist: add ares\_library\_initialized.\* to the tarball
* fix build on OpenBSD
* dist: ship msvc\_ver.inc too
* test: Add gTest/gMock files to SOURCES
* test: add fuzz entrypoint for ares\_create\_query()
* configure: clock\_gettime workaround
* docs: convert INSTALL to MarkDown &amp; tweak
* ares\_process: fix return type of socket\_create function (win32 warning)
* docs: fixed references to ares\_set\_local\_ip4 and ares\_set\_local\_ip6
* Windows DNS server sorting
* Use ares\_socklen\_t instead of socket\_t
* ares\_create\_query: use ares\_free not naked free
* msvc\_ver.inc support most recent Visual Studio 2017
* acountry: Convert char from ISO-8859-1 to UTF-8
* ares\_expand\_name: limit number of indirections
* configure: do not check for ar if specified manually
* Added support for Windows DNS Suffix Search List
* ares.h: support compiling with QNX


<a name="1_12_0"></a>
## c-ares version 1.12.0 - Sep 29 2016

Changes:

* api: add ARES\_OPT\_NOROTATE optmask value

Bug fixes:

* [CVE-2016-5180: ares\_create\_query single byte out of buffer write](https://c-ares.org/adv_20160929.html)
* configure: acknowledge --disable-tests \[1\]
* man pages: fix typos detected by Lintian
* test: add missing \#includes for dns-proto.cc
* test: avoid in6addr\_\* constants
* test: Build with MinGW on AppVeyor
* Makefile.m32: add support for extra flags
* Makefile.m32: add support for CROSSPREFIX
* configure: check if tests can get built before enabled
* ares\_library\_cleanup: reset ares\_realloc too
* ahost.c: add cast to fix C++ compile
* test: Only pass unused args to GoogleTest
* build: commonize MSVC version detection
* msvc\_ver.inc: support Visual Studio 2015 Update 1, 2, 3
* test: for AF\_UNSPEC, return CNAME only for AAAA, but valid A record
* ares\_getnameinfo: explicitly clear struct servent before use
* test: Update fuzzing function prototype
* init: fix nsort initialization
* test: add fuzzing check script to tests
* web: http =&gt; https
* read\_tcp\_data: remove superfluous NULL check
* LICENSE.md: add a stand-alone license file
* SECURITY.md: suggested "security process" for the project
* ares\_init\_options: only propagate init failures from options \[2\]
* headers: remove checks for and defines of variable sizes
* test: fix gMock to work with gcc &gt;= 6.x \[3\]


<a name="1_11_0"></a>
## c-ares version 1.11.0 - Feb 19 2016

Changes:

* Add a unit test suite
* Allow builds with code converage with --enable-code-coverage configure option
* Allow library-wide override of malloc/free
* Allow multiple -s options to the ahost command
* api: Expose the ares\_library\_initialized() function
* api: Add ares\_set\_sortlist(3) entrypoint
* api: Add entrypoints to allow use of per-server ports
* api: introduce \`ares\_parse\_txt\_reply\_ext\`
* api: Add ares\_set\_socket\_configure\_callback()

Bug fixes:

* timeadd: make static
* timeoffset: made static and private
* nowarn: use limits.h instead of configure for size of long
* single\_domain: Invalid memory access for empty string input
* ares\_build.h: fix building on 64-bit powerpc
* Allow specification of search domain in ahost
* Don't override explicitly specified search domains
* ares\_parse\_soa\_reply: Do not leak rr\_name on allocation failure
* Update ahost man page to describe -s option
* host\_callback: Fall back to AF\_INET on searching with AF\_UNSPEC
* Add -t u option to ahost
* CONTRIBUTING: added
* ares\_set\_servers\_csv: fix NULL dereference
* Fix integer shift overflow if both tcp\_socket and udp\_socket are set
* fix acountry memory leak
* lookup\_service: prevent tmpbuf from overrunning
* ares\_getnameinfo.3: there is no ares_getaddrinfo
* init\_by\_defaults: Continue loop if space for hostname not large enough
* Destroy options if ares_save_options fails
* ares\_\_read\_line: free buf on realloc failure
* added define for visual studio 2013
* windows: fix slow DNS lookup issue
* Use libresolv to initialize cares on iPhone targets
* buildconf: remove check for libtool, it only requires libtoolize
* init\_by\_resolv\_conf: Don't exit loop early leaving uninitialized entries
* ahost: check the select() return code
* configure\_socket: explicitly ignore return code
* read\_tcp\_data: don't try to use NULL pointer after malloc failure
* Distribute all man pages
* ares_expand_name: check for valid bits in label length
* ares\_\_read\_line: clear buf pointer on realloc failure
* process\_answer: fix things up correctly when removing EDNS option
* ares\_parse\_txt\_reply: propagate errors from per-substring loop
* ares\_gethostbyname: don't leak valid-but-empty hostent
* ares\_init\_options: don't lose init failure
* ares\_dup: clear new channel on failure
* config\_sortlist: free any existing sortlist on (re)alloc failure
* ares\_striendstr: fix so non-NULL return can happen
* bitncmp: update comment to match code behaviour
* ares\_set\_servers\_csv.3: make return type match code
* init\_by\_resolv\_conf: ignore `fopen` errors to use default values
* Use "resolve" as synonym of "dns" in nsswitch.conf
* ares\_win32\_init: make LoadLibrary work when using UNICODE too
* dist: Distribute README.md
* configure: build silently by default
* ares\_dup.3: remove mention of nonexistent function


<a name="1_10_0"></a>
## c-ares version 1.10.0 - May 12 2013

Changes:

* Added ares\_create\_query(), to be used instead of ares\_mkquery()
* ares\_inet\_ntop() and ares\_inet\_pton() are now recognized c-ares functions

Bug fixes:

* include the ares\_parse\_soa\_reply.\* files in the tarball
* read\_udp\_packets: bail out loop on bad sockets
* get\_DNS\_AdaptersAddresses: fix IPv6 parsing
* adig: perror() doesn't work for socket errors on windows
* ares\_parse\_aaaa\_reply: fix memory leak
* setup\_once.h: HP-UX sys/socket.h issue workaround
* configure: several fixes
* config-dos.h: define strerror() to strerror\_s\_() for High-C
* config-dos.h: define HAVE_CLOSE_S for MSDOS/Watt-32
* ares\_build.h.dist: enhance non-configure GCC ABI detection logic
* ares.h: stricter CARES_EXTERN linkage decorations logic
* ares\_cancel(): cancel requests safely
* protocol parsing: check input data stricter
* library init: be recursive, reference count inits/cleanups
* ares\_parse\_txt\_reply: return a ares_txt_reply node for each sub-string
* ares\_set\_servers\_csv: fixed IPv6 address parsing
* build: fix build on msvc11


<a name="1_9_1"></a>
## c-ares version 1.9.1 - Jun 18 2012

Fixed:

* include the ares\_parse\_soa\_reply.\* files in the tarball


<a name="1_9_0"></a>
## c-ares version 1.9.0 - Jun 17 2012

Changed:

* Added ares\_parse\_soa\_reply

Fixed:

* libcares.pc generation for static MingW\* cross builds
* ares\_dup: UDP and TCP port byte order in saved options


<a name="1_8_0"></a>
## c-ares version 1.8.0 - Apr 27 2012

Changed:

* Added ares\_parse\_naptr\_reply()

Fixed:

* handle CNAME-only in ares\_parse\_aaaa\_reply()
* support multiple DNS servers on Android
* check for \_\_ANDROID\_\_ in addition to ANDROID macro
* port numbers: convert them to network order
* get\_iphlpapi\_dns\_info: fix buffer overrun
* configure: make CURL\_CHECK\_DEF ignore leading whitespace
* segfault triggered in ares\_init\_options()
* ares\_getnameinfo's memcpy did not copy enough bytes
* ares\_destroy: fix segfault in ares\_destroy\_options()
* CHANGES: generate from script
* configure: fix symbol hiding usability check


<a name="1_7_5"></a>
## c-ares version 1.7.5 - Aug 16 2011

Fixed:

* detection of semicolon comments in resolv.conf
* avoid using system's inet\_net\_pton affected by the WLB-2008080064 advisory
* replacement ares\_inet\_net\_pton affected by the WLB-2008080064 advisory
* replacement ares\_inet\_ntop affected by potential out of bounds write
* added install target to Makefile.msvc
* only fall back to AF\_INET searches when looking for AF\_UNSPEC addresses
* fixed ares\_parse\_\*\_reply memory leaks
* Use correct sizeof in ares\_getnameinfo()
* IPv6-on-windows: find DNS servers correctly
* man pages: docs for the c-ares utility programs
* getservbyport replacement for Win CE
* config\_sortlist: (win32) missing else
* advance\_tcp\_send\_queue: avoid NULL ptr dereference
* configure: fix a bashism
* ares\_expand\_name: Fix encoded length for indirect root


<a name="1_7_4"></a>
## c-ares version 1.7.4 - Dec 9 2010

Changed:

* local-bind: Support binding to local interface/IPs, see ares\_set\_local\_ip4, ares\_set\_local\_ip6, ares\_set\_local\_dev

Fixed:

* memory leak in ares\_getnameinfo
* add missing break that caused get\_ares\_servers to fail
* ares\_parse\_a\_reply: fix CNAME response parsing
* init\_by\_options: don't copy an empty sortlist
* Replaced uint32\_t with unsigned int to fix broken builds on a couple of platforms
* Fix lookup with HOSTALIASES set
* adig: fix NAPTR parsing
* compiler warning cleanups


<a name="1_7_3"></a>
## c-ares version 1.7.3 - Jun 11 2010

Fixed:

* builds on Android
* now includes all files necessary to build it (1.7.2 lacked a file)


<a name="1_7_2"></a>
## c-ares version 1.7.2 - Jun 10 2010

Changed:

* Added ares\_parse\_mx\_reply()

Fixed:

* ares\_init: Last, not first instance of domain or search should win
* improve alternative definition of bool
* fix VS2010 compiler warnings


<a name="1_7_1"></a>
## c-ares version 1.7.1 - Mar 23 2010

Changed:

* added IPv6 name servers support

Fixed:

* closing of sockets on Windows systems
* MSVC deprecated compiler options warnings
* ares\_process\_fd() didn't check broken connections


<a name="1_7_0"></a>
## c-ares version 1.7.0 - Nov 30 2009

Changed:

* in6\_addr is not used in ares.h anymore, but a private ares\_in6\_addr is instead declared and used
* ares\_gethostbyname() now supports 'AF\_UNSPEC' as a family for resolving either AF\_INET6 or AF\_INET
* a build-time configured ares\_socklen\_t is now used instead of socklen\_t
* new ares\_library\_init() and ares\_library\_cleanup() functions
* new --enable-curldebug configure option
* ARES\_ECANCELLED is now sent as reason for ares\_cancel()
* added ares\_parse\_srv\_reply()
* added ares\_parse\_txt\_reply()
* added ares\_free\_data()
* new --enable-symbol-hiding configure option
* new Makefile.msvc for any MSVC compiler or MS Visual Studio version
* addrttl and addr6ttl structs renamed to ares\_addrttl and ares\_addr6ttl
* naming convention for libraries built with MSVC, see README.msvc

Fixed:

* ares\_parse\_\*\_reply() functions now return ARES\_EBADRESP instead of ARES\_EBADNAME if the name in the response failed to decode
* only expose/export symbols starting with 'ares\_'
* fix \\Device\\TCP handle leaks triggered by buggy iphlpapi.dll
* init without internet gone no longer fails
* out of bounds memory overwrite triggered with malformed /etc/hosts file
* function prototypes in man pages out of sync with ares.h


<a name="1_6_0"></a>
## c-ares version 1.6.0 - Dec 9 2008

Changed:

* Added support for the glibc "rotate" resolv.conf option (or ARES\_OPT\_ROTATE)
* Added ares\_gethostbyname\_file()
* Added ares\_dup()
* Added ares\_set\_socket\_callback()

Fixed:

* improved configure detection of several functions
* improved source code portability
* adig supports a regular numerical dotted IP address for the -s option
* handling of EINPROGRESS for UDP connects
* ares\_parse\_ptr\_reply() would cause a buffer to shrink instead of expand if a reply contained 8 or more records
* buildconf works on OS X


<a name="1_5_3"></a>
## c-ares version 1.5.3 - Aug 29 2008

* fix adig sample application compilation failure on some systems
* fix pkg-config reporting of private libraries needed for static linking
* fallback to gettimeofday when monotonic clock is unavailable at run-time
* ares\_gethostbyname() fallback from AAA to A records with CNAME present
* allow --enable-largefile and --disable-largefile configurations
* configure process no longer needs nor checks size of curl\_off\_t
* library will now be built with \_REENTRANT symbol defined if needed
* Improved configure detection of number of arguments for getservbyport\_r
* Improved query-ID randomness
* Validate that DNS response address matches the request address
* fix acountry sample application compilation failure on some systems


<a name="1_5_2"></a>
## c-ares version 1.5.2 - May 29 2008

* code refactoring in ares\_gethostbyaddr
* improved checking of /dev/urandom in configure script
* new sample application, acountry
* improved MSVC6 dsp files
* adig sample application supports NAPTR records
* improved file seeding randomizer
* improved parsing of resolver configuration files
* updated configure script to remove autoconf 2.62 warnings
* use monotonic time source if available
* return all PTR-records when doing reverse lookups
* millisecond resolution support for the timeout option


<a name="1_5_1"></a>
## c-ares version 1.5.1 - Nov 21 2007

* added the ares\_llist.h header that was missing in the 1.5.0 release


<a name="1_5_0"></a>
## c-ares version 1.5.0 - Nov 21 2007

* SONAME bump to a few API and ABI breaking changes: - ares\_host\_callback() - ares\_nameinfo\_callback() - ares\_parse\_a\_reply() - ares\_parse\_aaaa\_reply()
* two valgrind reports were silenced
* ares\_save\_options() fix
* do DNS retries even on TCP connections
* correctly clear sockets from the fd\_set in several functions
* always wait on TCP events to detect connect closures
* new socket options: ARES\_OPT\_SOCK\_SNDBUF and ARES\_OPT\_SOCK\_RCVBUF
* made the query callbacks receive the number of timeouts that happened during the execution of a query
* don't skip a server if it's the only one
* segfault when generating a DNS "Transaction ID" under low memory conditions
* ares\_strerror() segfault fix
* added copyright texts to a few places that were missing them


<a name="1_4_0"></a>
## c-ares version 1.4.0 - Jun 8 2007

* fixed VS2005 compiler warnings due to time\_t being 64bit
* introduced cryptographically secure transaction IDs
* added ares\_save\_options()
* added ares\_destroy\_options()
* added ares\_process\_fd()
* fixed undefined return value in init\_by\_resolv\_conf() function for windows
* added ares\_parse\_ns\_reply()
* fix failure to get the search sequence of /etc/hosts and DNS from /etc/nsswitch.conf, /etc/host.conf or /etc/svc.conf when /etc/resolv.conf did not exist
* when domains were sert in the options struct, and there were domain/search entries in /etc/resolv.conf, the domains of the options struct would be overridden
* removed a couple of potential zero size memory allocations
* fixed the line endings in areslib.dsp
