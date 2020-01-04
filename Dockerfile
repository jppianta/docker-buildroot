FROM ubuntu

# Install dependencies
RUN apt-get update
RUN apt-get -y install make gcc file python3 perl g++ patch wget cpio unzip rsync bc qemu-system

# Copy aliases file
COPY alias.sh .

# Add and extract buildroot
ADD https://buildroot.org/downloads/buildroot-2019.11.tar.gz .
RUN tar -zxf buildroot-2019.11.tar.gz
RUN mv buildroot-2019.11/ buildroot/
RUN rm buildroot-2019.11.tar.gz

WORKDIR /buildroot/

# Copy custom defconfig to configs folder
COPY jppianta_defconfig ./configs/

# Create board folder and copy linux custom config file
RUN mkdir ./board/jppianta/
COPY jppianta_linux.config ./board/jppianta/

# Exexute custom configs
RUN make jppianta_defconfig

# Compile all
RUN make