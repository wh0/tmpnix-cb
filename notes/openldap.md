```
cc -g -O2 -I../../include -I../../include       -c -o slapd-watcher.o slapd-watcher.c
/tmp/nix/store/91gza0zcl96wz8pkhjqdqlxvlwnlf51g-bash-5.1-p16/bin/bash ../../libtool --mode=link cc  -g -O2     -o ldif-filter ldif-filter.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la -lsasl2 -lssl -lcrypto  -lcrypt  
libtool: link: cc -g -O2 -o .libs/ldif-filter ldif-filter.o slapd-common.o  ../../libraries/liblutil/liblutil.a ../../libraries/libldap/.libs/libldap.so /tmp/nix-build-openldap-2.6.2.drv-0/openldap-2.6.2/libraries/liblber/.libs/liblber.so ../../libraries/liblber/.libs/liblber.so /tmp/nix/store/m0lz4pcyksspglm1vr31nyzv7x490ijs-cyrus-sasl-2.1.28/lib/libsasl2.so -lssl -lcrypto -lcrypt -Wl,-rpath -Wl,/tmp/nix/store/14mdgbb5y2ansh10x3lcf6ars50rrnw3-openldap-2.6.2/lib -Wl,-rpath -Wl,/tmp/nix/store/m0lz4pcyksspglm1vr31nyzv7x490ijs-cyrus-sasl-2.1.28/lib
/tmp/nix/store/8dj3c1bx6y4qincclpnkspaybh50fqqq-binutils-2.38/bin/ld: cannot find slapd-common.o: No such file or directory
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:320: ldif-filter] Error 1
make[2]: Leaving directory '/tmp/nix-build-openldap-2.6.2.drv-0/openldap-2.6.2/tests/progs'
make[1]: *** [Makefile:394: all-common] Error 1
make[1]: Leaving directory '/tmp/nix-build-openldap-2.6.2.drv-0/openldap-2.6.2/tests'
make: *** [Makefile:320: all-common] Error 1
error: builder for '/tmp/nix/store/cgslya0yg2drryr9sh6rd69nbpn131jr-openldap-2.6.2.drv' failed with exit code 2
error: 1 dependencies of derivation '/tmp/nix/store/5mzwrd7g6lgkws1ramrbwrl2iy9q33gd-apr-util-1.6.1.drv' failed to build
error: 2 dependencies of derivation '/tmp/nix/store/ym8qmhdf5b53v0b7kxa1apaqrv6haci5-apache-httpd-2.4.54.drv' failed to build
```

https://github.com/NixOS/nixpkgs/issues/175626
