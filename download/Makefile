ROOT=..

MAINPARTS= $(ROOT)/doctype.t $(ROOT)/body.t $(ROOT)/footer.t $(ROOT)/setup.t \
 $(ROOT)/menu.t Makefile $(ROOT)/docmenu.t $(ROOT)/css.t
OPTS=-WWW -Uunix -H -C -V -I$(ROOT) -LL
FCPP=fcpp 
ACTION=$(FCPP) $(OPTS) $< $@
MAN2HTML= roffit --bare --mandir=ares-cvs --hrefdir=.

all:	index.html

index.html: index.t $(MAINPARTS)
	$(ACTION)

clean:
	find . -name "*~" -exec rm {} \;
	rm -f *.raw *.html
