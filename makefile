#
# makefile
#

CC      = cc
CPPFLAGS += -D_DEFAULT_SOURCE -D_BSD_SOURCE -DNDEBUG
CFLAGS += -O2 -std=c11 -Wall -pedantic -g
LD      = cc
LDFLAGS = -o
LIBS    = -lncursesw
CP      = cp
MV      = mv
RM      = rm -rf
PREFIX  = /usr/local
BINDIR  = $(PREFIX)/bin

OBJ     = command.o display.o complete.o data.o gap.o key.o search.o buffer.o replace.o window.o undo.o funcmap.o utils.o hilite.o main.o

all: femto

femto: $(OBJ)
	$(LD) $(LDFLAGS) femto $(OBJ) $(LIBS)

%.o: %.c header.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $<

clean:
	-$(RM) $(OBJ) femto

install:
	strip femto
	mkdir -pv $(BINDIR)
	install -m 755 femto $(BINDIR)/femto

