FROM gitpod/workspace-full:latest

# optional: use a custom apache config.
#COPY apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
#ENV APACHE_DOCROOT_IN_REPO="www"



USER root

#RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421


# Install Eclipse deps
RUN sudo apt-get update \
    && DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends build-essential \
    && apt-get update   
     #  gcc g++ automake libtool lsb-release make  clang-format-6.0   libdbus-1-dev libboost-dev libreadline-dev  \   
 

#RUN curl -o /var/lib/apt/dazzle-marks/llvm.gpg -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key \
#    && apt-key add /var/lib/apt/dazzle-marks/llvm.gpg \
#    && echo "deb https://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list.d/llvm.list \
 #   && install-packages \
 #       clang \
#        clangd \
#        clang-format \
#        clang-tidy \
#        gdb \
 #       lld


#gcc g++ automake    \
#               libtool lsb-release make  clang-format-6.0   libdbus-1-dev libboost-dev libreadline-dev 


#RUN apt-get update                                                                                        \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends dbus gcc g++ automake    \
#               libtool lsb-release make  clang-format-6.0   libdbus-1-dev libboost-dev libreadline-dev    \                                     
#               autoconf autoconf-archive  software-properties-common bsdtar                \
#    && apt-get update  


#install mbed
#RUN python3 -m pip install mbed-cli
# mbed config -G ARM_PATH "C:\Program Files\ARM"


              
              

#remove:   default-jre  libxtst-dev


# Install Eclipse
#RUN wget "http://eclipse.mirror.rafal.ca/oomph/epp/2019-12/R/eclipse-inst-linux64.tar.gz" \
#    && tar -xf *.tar.gz \
#    && mv eclipse-installer /tmp

#https://apt.llvm.org/
#wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

#RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
    
# Get gcc-arm-embedded key
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B4D03348F75E3362B1E1C2A1D1FAA6ECF64D33B0

# Add ggc-arm-embedded ppa
#RUN echo "deb http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu bionic main" > /etc/apt/sources.list.d/team-gcc-arm-embedded-ubuntu-ppa-bionic.list

# Install gcc-arm-armbedded
#RUN apt update && apt install -y --no-install-recommends \
#    gcc-arm-embedded \
# && rm -rf /var/lib/apt/lists/*  
    




USER gitpod

#install mbed
#RUN python3 -m pip install mbed-cli

#RUN cd /home/linuxbrew/.linuxbrew                                                                 \
#    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh    \
#    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"   \
#    && python3 -m pip install mbed-cli         
              

  
RUN mkdir -p /home/gitpod/logs                                                                            \ 
    && touch /home/gitpod/logs/myDockerlog.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/logs/myDockerlog.txt  \
    && echo "Installation end"                                      >> /home/gitpod/logs/myDockerlog.txt  
   

# Give back control
USER root


# Cleaning
RUN apt-get clean  && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
