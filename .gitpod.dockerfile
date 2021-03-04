FROM gitpod/workspace-full:latest

# optional: use a custom apache config.
#COPY apache.conf /etc/apache2/apache2.conf

# optional: change document root folder. It's relative to your git working copy.
#ENV APACHE_DOCROOT_IN_REPO="www"





USER gitpod

# Install Eclipse deps
RUN sudo apt-get update \
    && sudo apt-get install -y \
       make build-essential clang-12 lldb-12 lld-12  libllvm-12-ocaml-dev libllvm12 \
       llvm-12 llvm-12-dev llvm-12-doc llvm-12-examples llvm-12-runtime libc++-12-dev libc++abi-12-dev     \
        

#remove:   default-jre  libxtst-dev


# Install Eclipse
#RUN wget "http://eclipse.mirror.rafal.ca/oomph/epp/2019-12/R/eclipse-inst-linux64.tar.gz" \
#    && tar -xf *.tar.gz \
#    && mv eclipse-installer /tmp

#https://apt.llvm.org/
#wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
