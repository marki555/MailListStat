# Makefile for MailListStat (MLS)
# (C) 2001-2003 Marek -Marki- Podmaka

# install won't work under Windows

# -m386 (486,pentium,pentiumpro)
#OPTIMIZE=-O7 -mpentiumpro
OPTIMIZE=-O3

# debug symbols will be stripped anyway during 'make install'
DEBUG=-g

#### DON'T CHANGE ANYTHING BELOW ####
DESTDIR=/usr/local
CFLAGS=-Wall $(OPTIMIZE) $(DEBUG) -fcommon # use "-fcommon" for this bug https://stackoverflow.com/questions/69908418/multiple-definition-of-first-defined-here-on-gcc-10-2-1-but-not-gcc-8-3-0
LIBS=-lm
CC=gcc

DEPS=mls.h mls_mime.h mls_text.h mls_list.h mls_stat.h
OBJS=mls.o mls_mime.o mls_text.o mls_list.o mls_stat.o

# https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

mls: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

install: mls
	install -m 755 -g root -o root -s mls $(DESTDIR)/bin
	install -m 644 -g root -o root mls.1 $(DESTDIR)/man/man1
	gzip -9f $(DESTDIR)/man/man1/mls.1
	@echo "**************************************************************"
	@echo "*** To use HTML feature or PHP wrapper, copy contents of   ***"
	@echo "*** 'html' subdirectory to location accessible by your     ***"
	@echo "*** webserver. See README for more info!                   ***"
	@echo "**************************************************************"
	@echo "*** See also 'examples' subdir for some hints...           ***"
	@echo "******************** MLS install complete ********************"

clean:
	rm -f $(wildcard *.o) mls

uninstall:
	rm -fv $(DESTDIR)/bin/mls
	rm -fv $(DESTDIR)/man/man1/mls.1.gz
