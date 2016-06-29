SHELL = /bin/sh
CC    = gcc
CFLAGS       = -fPIC 
LDFLAGS      = -shared
DEBUGFLAGS   = -O0 -D _DEBUG
RELEASEFLAGS = -O2 -D NDEBUG -combine -fwhole-program
LDLIBS= -lpthread -ldl
TARGET  = libbackup.so

SOURCES = $(shell echo *.c)
HEADERS = $(shell echo *.h)
OBJECTS = $(SOURCES:.c=.o)

PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin

all: $(TARGET)

install: 
	cp $(TARGET) /usr/lib32/

clean: 
	rm -rf *.o *.so

$(TARGET): $(OBJECTS)
	$(CC) $(FLAGS) $(CFLAGS) $(LDFLAGS) $(DEBUGFLAGS) -o $(TARGET) $(OBJECTS) $(LDLIBS)
