FROM ubuntu:14.04
MAINTAINER Matt Kemp <matt@mattikus.com>

RUN apt-get update && apt-get install -y wget
# Download statically compiled murmur and install it to /opt
RUN wget http://sourceforge.net/projects/mumble/files/Mumble/1.2.8/murmur-static_x86-1.2.8.tar.bz2/download -O - | bzcat -f | tar -x -C /opt -f -

# Read murmur.ini and murmur.sqlite from /data/
VOLUME ["/data"]

COPY /container_scripts/start_murmur /murmur/

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp

# Run murmur
CMD ["/bin/bash", "/murmur/start_murmur"]
