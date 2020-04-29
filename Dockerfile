FROM	ubuntu:18.04

RUN	apt-get -y update && apt-get -y install	\
		autoconf			\
		automake			\
		autopoint			\
		bash				\
		bison				\
		bzip2				\
    cmake       \
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

RUN	mkdir -p /wd
WORKDIR	/wd

RUN git clone https://github.com/mxe/mxe/ /wd/mxe

WORKDIR /wd/mxe

#RUN make download
RUN make PREFIX='/usr' MXE_PLUGIN_DIRS='plugins/gcc9 plugins/meson-wrapper' MXE_TARGETS='x86_64-w64-mingw32.static x86_64-w64-mingw32.shared' --jobs=4 --keep-going cc libusb1 boost

ENV PATH /usr/bin/:$PATH
ENV BOOST_ROOT /usr/x86_64-w64-mingw32.static:/usr/x86_64-w64-mingw32.shared

# get [boost].sml headers
RUN wget -O /usr/x86_64-w64-mingw32.static/include/boost/sml.hpp https://raw.githubusercontent.com/boost-experimental/sml/master/include/boost/sml.hpp && \
    wget -O /usr/x86_64-w64-mingw32.shared/include/boost/sml.hpp https://raw.githubusercontent.com/boost-experimental/sml/master/include/boost/sml.hpp

WORKDIR /usr/project
