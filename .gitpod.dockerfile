FROM gitpod/workspace-full:latest

# optional: use a custom apache config.
#COPY apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
#ENV APACHE_DOCROOT_IN_REPO="www"



USER root

#RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421


# Install Eclipse deps
RUN sudo apt-get update \
    && DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends \
       make build-essential clang-12 lldb-12 lld-12  libllvm-12-ocaml-dev libllvm12 \
       llvm-12 llvm-12-dev llvm-12-doc llvm-12-examples llvm-12-runtime libc++-12-dev libc++abi-12-dev     \
    && apt-get update    


#RUN apt-get update                                                                                        \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends dbus gcc g++ automake    \
#               libtool lsb-release make  clang-format-6.0   libdbus-1-dev libboost-dev libreadline-dev    \                                     
#               autoconf autoconf-archive  software-properties-common bsdtar                \
#    && apt-get update  








#remove:   default-jre  libxtst-dev


# Install Eclipse
#RUN wget "http://eclipse.mirror.rafal.ca/oomph/epp/2019-12/R/eclipse-inst-linux64.tar.gz" \
#    && tar -xf *.tar.gz \
#    && mv eclipse-installer /tmp

#https://apt.llvm.org/
#wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421


    
# Get gcc-arm-embedded key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B4D03348F75E3362B1E1C2A1D1FAA6ECF64D33B0

# Add ggc-arm-embedded ppa
RUN echo "deb http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu bionic main" > /etc/apt/sources.list.d/team-gcc-arm-embedded-ubuntu-ppa-bionic.list

# Install gcc-arm-armbedded
RUN apt update && apt install -y --no-install-recommends \
    gcc-arm-embedded \
 && rm -rf /var/lib/apt/lists/*  
    




USER gitpod
  
RUN mkdir -p /home/gitpod/logs                                                                            \ 
    && touch /home/gitpod/logs/myDockerlog.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/logs/myDockerlog.txt  \
    && echo "Installation end"                                      >> /home/gitpod/logs/myDockerlog.txt  
   

# Give back control
USER root


# Cleaning
RUN apt-get clean  && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
