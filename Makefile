PREFIX ?= /usr/local
DESTDIR ?= /
SYSCONFDIR ?= /etc

all: man
	sed -i "s|@sysconfdir@|$(SYSCONFDIR)|g" src/clxbuild

install:
	install -Dm 755 src/clxbuild $(DESTDIR)/$(PREFIX)/bin/clxbuild
	install -Dm 644 man/CLXBUILD.5 $(DESTDIR)/$(PREFIX)/man/man5/CLXBUILD.5
	install -Dm 644 man/clxbuild.8 $(DESTDIR)/$(PREFIX)/man/man8/clxbuild.8
	install -d -m 755 $(DESTDIR)/$(SYSCONFDIR)/clxbuild
	install -m 644 etc/CLXBUILD* $(DESTDIR)/$(SYSCONFDIR)/clxbuild/

man:
	make man -C man

clean:
	make clean -C man

.PHONY: all install man
