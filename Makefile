CFLAGS = -O3 -fPIC -Wall -Wextra -Wpedantic
#CFLAGS = -O3 -fPIC -Wall -Wextra -Wpedantic -march=native -mtune=native
TARGET = tmt.so

# by default, build for lua5.1, because it has ABI compabillity with luajit
LUA_CFLAGS = -I/usr/include/lua5.1 -std=gnu99
LUA_LIBS = -llua5.1

# we can also build for lua5.3
ifdef lua53
	LUA_CFLAGS = -I/usr/include/lua5.3
	LUA_LIBS = -llua5.3
endif


all: $(TARGET)

$(TARGET): lua_tmt.c
	$(CC) -shared -std=gnu99 -o $(TARGET) $(CFLAGS) $(LUA_CFLAGS) $(LUA_LIBS) -Wno-unused-variable lua_tmt.c tmt.h tmt.c
	strip $(TARGET)


clean:
	rm -f $(TARGET)
