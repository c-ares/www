#include "doctype.t"
<head>
<title>c-ares: docs</title>
#include "css.t"
</head>
#include "body.t"
#include "setup.t"
#include "menu.t"
#include "docmenu.t"

TITLE(c-ares documentation)
BOXTOP

<p>c-ares provides a set of library functions, datatypes, and enumerations
which integrators will use for their implementations.  When you install c-ares,
you get man pages which describe their use and meanings.

<ul>
#include "docs.gen"
</ul>

BOXBOT

#include "footer.t"
