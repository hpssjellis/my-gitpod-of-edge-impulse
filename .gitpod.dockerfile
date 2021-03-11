FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends build-essential gcc-arm-none-eabi make  \
    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
        && install-packages \
        clang \
        clangd \
        clang-format \
        clang-tidy \
        gdb \
        lld  \
    && apt-get update 



USER gitpod
  
RUN mkdir -p /home/gitpod/logs                                                                            \ 
    && touch /home/gitpod/logs/myDockerlog.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/logs/myDockerlog.txt  \
    && echo "Installation end"                                      >> /home/gitpod/logs/myDockerlog.txt  
   

# Give back control
USER root


# Cleaning
RUN apt-get clean  && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
