ROOT=.

MAINPARTS= $(ROOT)/doctype.t body.t footer.t $(ROOT)/setup.t \
 menu.t Makefile docmenu.t css.t
OPTS=-WWW -Uunix -H -C -V -I$(ROOT) -LL
FCPP=fcpp
ACTION=$(FCPP) $(OPTS) $< $@
SRCDIR=ares-cvs
MAN2HTML= roffit --bare --mandir=$(SRCDIR) --hrefdir=.
MARKDOWN=markdown

all: index.html license.html ares_init.html ares_init_options.html	\
 ares_destroy.html ares_expand_name.html ares_fds.html old.html		\
 ares_free_hostent.html ares_free_string.html ares_freeaddrinfo.html \
 ares_getaddrinfo.html ares_gethostbyaddr.html	\
 ares_gethostbyname.html ares_mkquery.html ares_parse_a_reply.html	\
 ares_parse_ptr_reply.html ares_process.html ares_query.html		\
 ares_search.html ares_send.html ares_strerror.html ares_timeout.html	\
 ares_version.html ares_parse_ptr_reply.html ares_expand_string.html	\
 ares_cancel.html docs.html ares_parse_aaaa_reply.html mailhead.html	\
 mailtop.html mailbot.html indextop.html indexbot.html otherlibs.html	\
 why.html ares_getnameinfo.html ares_getsock.html ares_process_fd.html	\
 ares_destroy_options.html ares_save_options.html			\
 ares_parse_ns_reply.html ares_library_init.html			\
 ares_library_cleanup.html ares_parse_srv_reply.html			\
 ares_parse_txt_reply.html ares_parse_soa_reply.html			\
 ares_inet_ntop.html ares_inet_pton.html ares_create_query.html		\
 security.html changelog.html vulns.html ares_dup.html			\
 adv_20160929.html ares_library_initialized.html ares_get_servers.html	\
 ares_get_servers_ports.html ares_set_servers.html			\
 ares_set_servers_ports.html ares_set_servers_ports_csv.html		\
 ares_set_servers_csv.html ares_free_data.html				\
 ares_gethostbyname_file.html ares_set_socket_callback.html		\
 ares_set_socket_configure_callback.html ares_set_sortlist.html		\
 ares_parse_mx_reply.html ares_parse_naptr_reply.html			\
 ares_set_local_dev.html ares_set_socket_functions.html 		\
 ares_library_init_android.html adv_20170620.html ares_getaddrinfo.html
	make -C download

index.html: index.t $(MAINPARTS)
	$(ACTION)

changelog.html: changelog.t $(MAINPARTS)
	$(ACTION)

vulns.html: vulns.t $(MAINPARTS)
	$(ACTION)

security.html: security.t $(MAINPARTS) security.gen
	$(ACTION)

security.gen: $(SRCDIR)/SECURITY.md
	$(MARKDOWN) < $< > $@

adv_20160929.html: adv_20160929.t $(MAINPARTS) adv_20160929.gen
	$(ACTION)
adv_20160929.gen: adv_20160929.md
	$(MARKDOWN) < $< > $@

adv_20170620.html: adv_20170620.t $(MAINPARTS) adv_20170620.gen
	$(ACTION)
adv_20170620.gen: adv_20170620.md
	$(MARKDOWN) < $< > $@

old.html: old.t $(MAINPARTS)
	$(ACTION)

otherlibs.html: otherlibs.t $(MAINPARTS)
	$(ACTION)

why.html: why.t $(MAINPARTS)
	$(ACTION)

docs.html: docs.t $(MAINPARTS)
	$(ACTION)

license.html: license.t $(MAINPARTS)
	$(ACTION)

mailhead.html: mailhead.t $(MAINPARTS)
	$(ACTION)

mailtop.html: mailtop.t $(MAINPARTS) mailmenu.t
	$(ACTION)
mailbot.html: mailbot.t $(MAINPARTS)
	$(ACTION)
indextop.html: indextop.t $(MAINPARTS) mailmenu.t
	$(ACTION)
indexbot.html: indexbot.t $(MAINPARTS)
	$(ACTION)

ares_init.html: ares_func.t ares_init.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_init -Ddocs_ares_init -Dfuncinc=\"ares_init.raw\" $< $@
ares_dup.html: ares_func.t ares_dup.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_dup -Ddocs_ares_dup -Dfuncinc=\"ares_dup.raw\" $< $@
ares_init_options.html: ares_func.t ares_init_options.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_init_options -Ddocs_ares_init_options -Dfuncinc=\"ares_init_options.raw\" $< $@
ares_mkquery.html: ares_func.t ares_mkquery.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_mkquery -Ddocs_ares_mkquery -Dfuncinc=\"ares_mkquery.raw\" $< $@
ares_create_query.html: ares_func.t ares_create_query.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_create_query -Ddocs_ares_create_query -Dfuncinc=\"ares_create_query.raw\" $< $@
ares_parse_a_reply.html: ares_func.t ares_parse_a_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_a_reply -Ddocs_ares_parse_a_reply -Dfuncinc=\"ares_parse_a_reply.raw\" $< $@
ares_parse_mx_reply.html: ares_func.t ares_parse_mx_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_mx_reply -Ddocs_ares_parse_mx_reply -Dfuncinc=\"ares_parse_mx_reply.raw\" $< $@
ares_parse_naptr_reply.html: ares_func.t ares_parse_naptr_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_naptr_reply -Ddocs_ares_parse_naptr_reply -Dfuncinc=\"ares_parse_naptr_reply.raw\" $< $@
ares_parse_aaaa_reply.html: ares_func.t ares_parse_aaaa_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_aaaa_reply -Ddocs_ares_parse_aaaa_reply -Dfuncinc=\"ares_parse_aaaa_reply.raw\" $< $@
ares_parse_ptr_reply.html: ares_func.t ares_parse_ptr_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_ptr_reply -Ddocs_ares_parse_ptr_reply -Dfuncinc=\"ares_parse_ptr_reply.raw\" $< $@
ares_process.html: ares_func.t ares_process.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_process -Ddocs_ares_process -Dfuncinc=\"ares_process.raw\" $< $@
ares_query.html: ares_func.t ares_query.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_query -Ddocs_ares_query -Dfuncinc=\"ares_query.raw\" $< $@
ares_search.html: ares_func.t ares_search.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_search -Ddocs_ares_search -Dfuncinc=\"ares_search.raw\" $< $@
ares_send.html: ares_func.t ares_send.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_send -Ddocs_ares_send -Dfuncinc=\"ares_send.raw\" $< $@
ares_strerror.html: ares_func.t ares_strerror.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_strerror -Ddocs_ares_strerror -Dfuncinc=\"ares_strerror.raw\" $< $@
ares_timeout.html: ares_func.t ares_timeout.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_timeout -Ddocs_ares_timeout -Dfuncinc=\"ares_timeout.raw\" $< $@
ares_version.html: ares_func.t ares_version.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_version -Ddocs_ares_version -Dfuncinc=\"ares_version.raw\" $< $@
ares_free_string.html: ares_func.t ares_free_string.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_free_string -Ddocs_ares_free_string -Dfuncinc=\"ares_free_string.raw\" $< $@
ares_free_data.html: ares_func.t ares_free_data.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_free_data -Ddocs_ares_free_data -Dfuncinc=\"ares_free_data.raw\" $< $@
ares_freeaddrinfo.html: ares_func.t ares_freeaddrinfo.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_freeaddrinfo -Ddocs_ares_freeaddrinfo -Dfuncinc=\"ares_freeaddrinfo.raw\" $< $@
ares_getaddrinfo.html: ares_func.t ares_getaddrinfo.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_getaddrinfo -Ddocs_ares_getaddrinfo -Dfuncinc=\"ares_getaddrinfo.raw\" $< $@
ares_gethostbyaddr.html: ares_func.t ares_gethostbyaddr.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_gethostbyaddr -Ddocs_ares_gethostbyaddr -Dfuncinc=\"ares_gethostbyaddr.raw\" $< $@
ares_gethostbyname.html: ares_func.t ares_gethostbyname.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_gethostbyname -Ddocs_ares_gethostbyname -Dfuncinc=\"ares_gethostbyname.raw\" $< $@
ares_gethostbyname_file.html: ares_func.t ares_gethostbyname_file.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_gethostbyname_file -Ddocs_ares_gethostbyname_file -Dfuncinc=\"ares_gethostbyname_file.raw\" $< $@
ares_getaddrinfo.html: ares_func.t ares_getaddrinfo.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_getaddrinfo -Ddocs_ares_getaddrinfo -Dfuncinc=\"ares_getaddrinfo.raw\" $< $@
ares_getnameinfo.html: ares_func.t ares_getnameinfo.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_getnameinfo -Ddocs_ares_getnameinfo -Dfuncinc=\"ares_getnameinfo.raw\" $< $@
ares_fds.html: ares_func.t ares_fds.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_fds -Ddocs_ares_fds -Dfuncinc=\"ares_fds.raw\" $< $@
ares_getsock.html: ares_func.t ares_getsock.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_getsock -Ddocs_ares_getsock -Dfuncinc=\"ares_getsock.raw\" $< $@
ares_free_hostent.html: ares_func.t ares_free_hostent.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_free_hostent -Ddocs_ares_free_hostent -Dfuncinc=\"ares_free_hostent.raw\" $< $@
ares_destroy.html: ares_func.t ares_destroy.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_destroy -Ddocs_ares_destroy -Dfuncinc=\"ares_destroy.raw\" $< $@
ares_cancel.html: ares_func.t ares_cancel.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_cancel -Ddocs_ares_cancel -Dfuncinc=\"ares_cancel.raw\" $< $@
ares_expand_name.html: ares_func.t ares_expand_name.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_expand_name -Ddocs_ares_expand_name -Dfuncinc=\"ares_expand_name.raw\" $< $@
ares_expand_string.html: ares_func.t ares_expand_string.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_expand_string -Ddocs_ares_expand_string -Dfuncinc=\"ares_expand_string.raw\" $< $@
ares_process_fd.html: ares_func.t ares_process.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_process_fd -Ddocs_ares_process_fd -Dfuncinc=\"ares_process.raw\" $< $@
ares_destroy_options.html: ares_func.t ares_destroy_options.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_destroy_options -Ddocs_ares_destroy_options -Dfuncinc=\"ares_destroy_options.raw\" $< $@
ares_save_options.html: ares_func.t ares_save_options.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_save_options -Ddocs_ares_save_options -Dfuncinc=\"ares_save_options.raw\" $< $@
ares_parse_ns_reply.html: ares_func.t ares_parse_ns_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_ns_reply -Ddocs_ares_parse_ns_reply -Dfuncinc=\"ares_parse_ns_reply.raw\" $< $@
ares_library_init.html: ares_func.t ares_library_init.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_library_init -Ddocs_ares_library_init -Dfuncinc=\"ares_library_init.raw\" $< $@
ares_library_init_android.html: ares_func.t ares_library_init_android.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_library_init_android -Ddocs_ares_library_init_android -Dfuncinc=\"ares_library_init_android.raw\" $< $@
ares_library_initialized.html: ares_func.t ares_library_initialized.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_library_initialized -Ddocs_ares_library_initialized -Dfuncinc=\"ares_library_initialized.raw\" $< $@
ares_library_cleanup.html: ares_func.t ares_library_cleanup.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_library_cleanup -Ddocs_ares_library_cleanup -Dfuncinc=\"ares_library_cleanup.raw\" $< $@
ares_parse_srv_reply.html: ares_func.t ares_parse_srv_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_srv_reply -Ddocs_ares_parse_srv_reply -Dfuncinc=\"ares_parse_srv_reply.raw\" $< $@
ares_parse_soa_reply.html: ares_func.t ares_parse_soa_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_soa_reply -Ddocs_ares_parse_soa_reply -Dfuncinc=\"ares_parse_soa_reply.raw\" $< $@
ares_parse_txt_reply.html: ares_func.t ares_parse_txt_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_txt_reply -Ddocs_ares_parse_txt_reply -Dfuncinc=\"ares_parse_txt_reply.raw\" $< $@
ares_inet_pton.html: ares_func.t ares_inet_pton.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_inet_pton -Ddocs_ares_inet_pton -Dfuncinc=\"ares_inet_pton.raw\" $< $@
ares_inet_ntop.html: ares_func.t ares_inet_ntop.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_inet_ntop -Ddocs_ares_inet_ntop -Dfuncinc=\"ares_inet_ntop.raw\" $< $@
ares_get_servers.html: ares_func.t ares_get_servers.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_get_servers -Ddocs_ares_get_servers -Dfuncinc=\"ares_get_servers.raw\" $< $@
ares_get_servers_ports.html: ares_func.t ares_get_servers.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_get_servers_ports -Ddocs_ares_get_servers_ports -Dfuncinc=\"ares_get_servers.raw\" $< $@
ares_set_local_dev.html: ares_func.t ares_set_local_dev.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_local_dev -Ddocs_ares_set_local_dev -Dfuncinc=\"ares_set_local_dev.raw\" $< $@
ares_set_servers.html: ares_func.t ares_set_servers.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_servers -Ddocs_ares_set_servers -Dfuncinc=\"ares_set_servers.raw\" $< $@
ares_set_servers_ports.html: ares_func.t ares_set_servers.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_servers_ports -Ddocs_ares_set_servers_ports -Dfuncinc=\"ares_set_servers.raw\" $< $@
ares_set_servers_csv.html: ares_func.t ares_set_servers.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_servers_csv -Ddocs_ares_set_servers_csv -Dfuncinc=\"ares_set_servers.raw\" $< $@
ares_set_servers_ports_csv.html: ares_func.t ares_set_servers_csv.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_servers_ports_csv -Ddocs_ares_set_servers_ports_csv -Dfuncinc=\"ares_set_servers_csv.raw\" $< $@
ares_set_socket_callback.html: ares_func.t ares_set_socket_callback.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_socket_callback -Ddocs_ares_set_socket_callback -Dfuncinc=\"ares_set_socket_callback.raw\" $< $@
ares_set_socket_configure_callback.html: ares_func.t ares_set_socket_configure_callback.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_socket_configure_callback -Ddocs_ares_set_socket_configure_callback -Dfuncinc=\"ares_set_socket_configure_callback.raw\" $< $@
ares_set_sortlist.html: ares_func.t ares_set_sortlist.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_sortlist -Ddocs_ares_set_sortlist -Dfuncinc=\"ares_set_sortlist.raw\" $< $@
ares_set_socket_functions.html: ares_func.t ares_set_socket_functions.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_set_socket_functions -Ddocs_ares_set_socket_functions -Dfuncinc=\"ares_set_socket_functions.raw\" $< $@


ares_init.raw: $(SRCDIR)/ares_init.3
	$(MAN2HTML) < $< >$@
ares_dup.raw: $(SRCDIR)/ares_dup.3
	$(MAN2HTML) < $< >$@
ares_init_options.raw: $(SRCDIR)/ares_init_options.3
	$(MAN2HTML) < $< >$@
ares_mkquery.raw: $(SRCDIR)/ares_mkquery.3
	$(MAN2HTML) < $< >$@
ares_create_query.raw: $(SRCDIR)/ares_create_query.3
	$(MAN2HTML) < $< >$@
ares_parse_a_reply.raw: $(SRCDIR)/ares_parse_a_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_mx_reply.raw: $(SRCDIR)/ares_parse_mx_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_naptr_reply.raw: $(SRCDIR)/ares_parse_naptr_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_aaaa_reply.raw: $(SRCDIR)/ares_parse_aaaa_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_ptr_reply.raw: $(SRCDIR)/ares_parse_ptr_reply.3
	$(MAN2HTML) < $< >$@
ares_process.raw: $(SRCDIR)/ares_process.3
	$(MAN2HTML) < $< >$@
ares_query.raw: $(SRCDIR)/ares_query.3
	$(MAN2HTML) < $< >$@
ares_search.raw: $(SRCDIR)/ares_search.3
	$(MAN2HTML) < $< >$@
ares_send.raw: $(SRCDIR)/ares_send.3
	$(MAN2HTML) < $< >$@
ares_strerror.raw: $(SRCDIR)/ares_strerror.3
	$(MAN2HTML) < $< >$@
ares_timeout.raw: $(SRCDIR)/ares_timeout.3
	$(MAN2HTML) < $< >$@
ares_version.raw: $(SRCDIR)/ares_version.3
	$(MAN2HTML) < $< >$@
ares_free_string.raw: $(SRCDIR)/ares_free_string.3
	$(MAN2HTML) < $< >$@
ares_free_data.raw: $(SRCDIR)/ares_free_data.3
	$(MAN2HTML) < $< >$@
ares_freeaddrinfo.raw: $(SRCDIR)/ares_freeaddrinfo.3
	$(MAN2HTML) < $< >$@
ares_getaddrinfo.raw: $(SRCDIR)/ares_getaddrinfo.3
	$(MAN2HTML) < $< >$@
ares_gethostbyaddr.raw: $(SRCDIR)/ares_gethostbyaddr.3
	$(MAN2HTML) < $< >$@
ares_gethostbyname.raw: $(SRCDIR)/ares_gethostbyname.3
	$(MAN2HTML) < $< >$@
ares_gethostbyname_file.raw: $(SRCDIR)/ares_gethostbyname_file.3
	$(MAN2HTML) < $< >$@
ares_getaddrinfo.raw: $(SRCDIR)/ares_getaddrinfo.3
	$(MAN2HTML) < $< >$@
ares_getnameinfo.raw: $(SRCDIR)/ares_getnameinfo.3
	$(MAN2HTML) < $< >$@
ares_free_hostent.raw: $(SRCDIR)/ares_free_hostent.3
	$(MAN2HTML) < $< >$@
ares_fds.raw: $(SRCDIR)/ares_fds.3
	$(MAN2HTML) < $< >$@
ares_getsock.raw: $(SRCDIR)/ares_getsock.3
	$(MAN2HTML) < $< >$@
ares_destroy.raw: $(SRCDIR)/ares_destroy.3
	$(MAN2HTML) < $< >$@
ares_cancel.raw: $(SRCDIR)/ares_cancel.3
	$(MAN2HTML) < $< >$@
ares_expand_name.raw: $(SRCDIR)/ares_expand_name.3
	$(MAN2HTML) < $< >$@
ares_expand_string.raw: $(SRCDIR)/ares_expand_string.3
	$(MAN2HTML) < $< >$@
ares_destroy_options.raw: $(SRCDIR)/ares_destroy_options.3
	$(MAN2HTML) < $< >$@
ares_save_options.raw: $(SRCDIR)/ares_save_options.3
	$(MAN2HTML) < $< >$@
ares_parse_ns_reply.raw: $(SRCDIR)/ares_parse_ns_reply.3
	$(MAN2HTML) < $< >$@
ares_library_cleanup.raw: $(SRCDIR)/ares_library_cleanup.3
	$(MAN2HTML) < $< >$@
ares_library_init.raw: $(SRCDIR)/ares_library_init.3
	$(MAN2HTML) < $< >$@
ares_library_init_android.raw: $(SRCDIR)/ares_library_init_android.3
	$(MAN2HTML) < $< >$@
ares_library_initialized.raw: $(SRCDIR)/ares_library_initialized.3
	$(MAN2HTML) < $< >$@
ares_parse_soa_reply.raw: $(SRCDIR)/ares_parse_soa_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_srv_reply.raw: $(SRCDIR)/ares_parse_srv_reply.3
	$(MAN2HTML) < $< >$@
ares_parse_txt_reply.raw: $(SRCDIR)/ares_parse_txt_reply.3
	$(MAN2HTML) < $< >$@
ares_inet_pton.raw: $(SRCDIR)/ares_inet_pton.3
	$(MAN2HTML) < $< >$@
ares_inet_ntop.raw: $(SRCDIR)/ares_inet_ntop.3
	$(MAN2HTML) < $< >$@
ares_get_servers.raw: $(SRCDIR)/ares_get_servers.3
	$(MAN2HTML) < $< >$@
ares_set_local_dev.raw: $(SRCDIR)/ares_set_local_dev.3
	$(MAN2HTML) < $< >$@
ares_set_servers.raw: $(SRCDIR)/ares_set_servers.3
	$(MAN2HTML) < $< >$@
ares_set_servers_csv.raw: $(SRCDIR)/ares_set_servers_csv.3
	$(MAN2HTML) < $< >$@
ares_set_socket_callback.raw: $(SRCDIR)/ares_set_socket_callback.3
	$(MAN2HTML) < $< >$@
ares_set_socket_configure_callback.raw: $(SRCDIR)/ares_set_socket_configure_callback.3
	$(MAN2HTML) < $< >$@
ares_set_sortlist.raw: $(SRCDIR)/ares_set_sortlist.3
	$(MAN2HTML) < $< >$@
ares_set_socket_functions.raw: $(SRCDIR)/ares_set_socket_functions.3
	$(MAN2HTML) < $< >$@

clean:
	find . -name "*~" -exec rm {} \;
	rm -f *raw
