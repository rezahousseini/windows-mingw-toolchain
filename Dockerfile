FROM	ubuntu:18.04

RUN	apt-get -y update && apt-get -y install	\
		autoconf			\
		automake			\
		autopoint			\
		bash				\
		bison				\
		bzip2				\
		flex				\
    g++				\
    g++-multilib			\
		gettext				\
		git				\
		gperf				\
		intltool			\
    libc6-dev-i386 \
		libgdk-pixbuf2.0-dev		\
		libltdl-dev			\
		libssl-dev			\
    libtool-bin				\
		libxml-parser-perl		\
    lzip \
		make				\
    ninja-build \
		openssl				\
		p7zip-full			\
		patch				\
		perl				\
		pkg-config			\
		python				\
    python3-pip \
		ruby				\
		sed				\
		unzip				\
		wget				\
		xz-utils

# Install meson
RUN pip3 install meson


RUN	groupadd --gid 10000 mxe
RUN	useradd --uid 10000 --gid 10000 mxe

RUN	mkdir -p /wd && chown -R mxe:mxe /wd
WORKDIR	/wd

USER mxe

RUN git clone https://github.com/mxe/mxe/ /wd/mxe

WORKDIR /wd/mxe

#RUN make download
RUN make MXE_TARGETS='x86_64-w64-mingw32.static x86_64-w64-mingw32.shared' --jobs=4 --keep-going cc libusb1


ENV PATH $PATH:/wd/mxe/usr/bin

WORKDIR /usr/project
