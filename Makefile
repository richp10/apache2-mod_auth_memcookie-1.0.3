MY_APXS=/usr/local/apache2/bin/apxs
MY_LDFLAGS=-lmemcache -L/usr/local/lib/ 
MY_CFLAGS= -I/data/build/memcached/memcached-1.4.15/

.SUFFIXES: .c .o .la
.c.la:
	$(MY_APXS) $(MY_LDFLAGS) $(MY_CFLAGS) -c $< 

all:  mod_auth_memcookie.la

install: mod_auth_memcookie.la
	@echo "-"$*"-" "-"$?"-" "-"$%"-" "-"$@"-" "-"$<"-"
	$(MY_APXS) -i $?

clean:
	-rm -f *.o *.lo *.la *.slo 
	-rm -rf .libs


