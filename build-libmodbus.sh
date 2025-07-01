#!/bin/bash
cd /build
wget https://github.com/stephane/libmodbus/releases/download/v3.1.10/libmodbus-3.1.10.tar.gz
tar -xf libmodbus-3.1.10.tar.gz
cd /build/libmodbus-3.1.10
export PATH=/build/mxe/usr/bin:/build/mxe/usr/x86_64-pc-linux-gnu/bin$:$PATH
./configure --host='x86_64-w64-mingw32.shared' --build='x86_64-pc-linux-gnu' --prefix='/build/mxe/usr/x86_64-w64-mingw32.shared'  --disable-static --enable-shared
make
make install
