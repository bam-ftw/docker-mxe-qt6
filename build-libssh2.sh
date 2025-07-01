#!/bin/bash
wget https://libssh2.org/download/libssh2-1.11.0.tar.gz
tar -xf libssh2-1.11.0.tar.gz
cd /build/libssh2-1.11.0
export PATH=/build/mxe/usr/bin:/build/mxe/usr/x86_64-pc-linux-gnu/bin$:$PATH
./configure --host='x86_64-w64-mingw32.shared' --build='x86_64-pc-linux-gnu' --prefix='/build/mxe/usr/x86_64-w64-mingw32.shared'  --disable-static --enable-shared  ac_cv_prog_HAVE_DOXYGEN="false" --{docdir,infodir,mandir}='/build/mxe/tmp-libssh2-x86_64-w64-mingw32.shared/libssh2-1.11.0.build_.sink' --disable-examples-build --disable-rpath --with-crypto=wincng PKG_CONFIG='x86_64-w64-mingw32.shared-pkg-config' --with-crypto=openssl
make
make install
