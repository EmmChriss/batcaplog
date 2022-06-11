PKGNAME     := batcaplog
PKGDESC     := POSIX Shell script to periodically log battery capacity

SCRIPT      = $(PKGNAME).sh

SRV_UNIT    = systemd/$(PKGNAME).service
SRV_TIMER   = systemd/$(PKGNAME).timer

PREFIX      = /usr
BINDIR      = $(DESTDIR)$(PREFIX)/bin
SRVDIR      = $(DESTDIR)$(PREFIX)/lib/systemd/system

install:
	mkdir -p $(BINDIR)
	chmod 755 $(SCRIPT)
	cp $(SCRIPT) $(BINDIR)/$(PKGNAME)
	cp $(SRV_UNIT) $(SRVDIR)
	cp $(SRV_TIMER) $(SRVDIR)

uninstall:
	$(RM) $(BINDIR)/$(PKGNAME) $(SRVDIR)/$(PKGNAME).*

.PHONY: install uninstall