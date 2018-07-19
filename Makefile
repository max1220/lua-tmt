#!/bin/bash
CFLAGS   = -O3 -fPIC -I/usr/include/lua5.1 -Wall -Wextra
LIBS     = -shared -llua5.1
TARGET   = tmt.so

all: $(TARGET)

$(TARGET): lua_tmt.c tmt.o tmt.h
	$(CC) -o $(TARGET) tmt.o lua_tmt.c $(CFLAGS) $(LIBS)
	strip $(TARGET)

clean:
	rm -f $(TARGET) tmt.o
