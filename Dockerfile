FROM debian:latest

RUN apt update
RUN apt-get install -y autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git\
    gperf intltool libc6-dev libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libgl-dev libssl-dev\
    libtool-bin libxml-parser-perl lzip make openssl p7zip-full patch perl\
    python-is-python3 python3 python3-mako python3-pkg-resources ruby sed unzip wget xz-utils
RUN mkdir /build
WORKDIR /build
RUN git clone https://github.com/mxe/mxe.git
WORKDIR /build/mxe
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' openssl qt6

# We install libssh2, too. However, MXE compiles libssh2 with the Windows Crypt backend,
# which is undesirable because ed25519 is not supported and the usage of RSA
# results in indefinite freezes of client applications.
ADD build-libssh2.sh /build/build-libssh2.sh
ADD build-libmodbus.sh /build/build-libmodbus.sh
WORKDIR /build
RUN bash build-libssh2.sh
RUN bash build-libmodbus.sh
