ROOT=.

MAINPARTS= $(ROOT)/doctype.t body.t footer.t $(ROOT)/setup.t \
 menu.t Makefile docmenu.t css.t
OPTS=-WWW -Uunix -H -C -V -I$(ROOT) -LL
FCPP=fcpp 
ACTION=$(FCPP) $(OPTS) $< $@
SRCDIR=ares-cvs
MAN2HTML= roffit --bare --mandir=$(SRCDIR) --hrefdir=.
MARKDOWN=markdown

all:	index.html license.html ares_init.html ares_destroy.html \
	ares_expand_name.html ares_fds.html old.html \
	ares_free_hostent.html ares_free_string.html ares_gethostbyaddr.html \
	ares_gethostbyname.html ares_mkquery.html ares_parse_a_reply.html \
	ares_parse_ptr_reply.html ares_process.html ares_query.html \
	ares_search.html ares_send.html ares_strerror.html ares_timeout.html \
	ares_version.html ares_parse_ptr_reply.html ares_expand_string.html \
	ares_cancel.html docs.html ares_parse_aaaa_reply.html mailhead.html \
	mailtop.html mailbot.html indextop.html indexbot.html \
	otherlibs.html why.html ares_getnameinfo.html ares_getsock.html \
	ares_process_fd.html ares_destroy_options.html \
	ares_save_options.html ares_parse_ns_reply.html \
	ares_library_init.html ares_library_cleanup.html \
	ares_parse_srv_reply.html ares_parse_txt_reply.html \
	ares_parse_soa_reply.html ares_inet_ntop.html ares_inet_pton.html \
	security.html
	make -C download

index.html: index.t $(MAINPARTS)
	$(ACTION)

security.html: security.t $(MAINPARTS) security.gen
	$(ACTION)

security.gen: $(SRCDIR)/SECURITY.md
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
ares_mkquery.html: ares_func.t ares_mkquery.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_mkquery -Ddocs_ares_mkquery -Dfuncinc=\"ares_mkquery.raw\" $< $@
ares_parse_a_reply.html: ares_func.t ares_parse_a_reply.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_parse_a_reply -Ddocs_ares_parse_a_reply -Dfuncinc=\"ares_parse_a_reply.raw\" $< $@
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
ares_gethostbyaddr.html: ares_func.t ares_gethostbyaddr.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_gethostbyaddr -Ddocs_ares_gethostbyaddr -Dfuncinc=\"ares_gethostbyaddr.raw\" $< $@
ares_gethostbyname.html: ares_func.t ares_gethostbyname.raw $(MAINPARTS)
	$(FCPP) $(OPTS) -Dfunc=ares_gethostbyname -Ddocs_ares_gethostbyname -Dfuncinc=\"ares_gethostbyname.raw\" $< $@
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



ares_init.raw: $(SRCDIR)/ares_init.3
	$(MAN2HTML) < $< >$@
ares_mkquery.raw: $(SRCDIR)/ares_mkquery.3
	$(MAN2HTML) < $< >$@
ares_parse_a_reply.raw: $(SRCDIR)/ares_parse_a_reply.3
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
ares_gethostbyaddr.raw: $(SRCDIR)/ares_gethostbyaddr.3
	$(MAN2HTML) < $< >$@
ares_gethostbyname.raw: $(SRCDIR)/ares_gethostbyname.3
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

clean:
	find . -name "*~" -exec rm {} \;
	rm -f *raw
