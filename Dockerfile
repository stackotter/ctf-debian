FROM debian

# Install basics
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y \
 git \
 gdb \
 gdbserver \
 man-db \
 netcat \
 python2 \
 python3.9 \
 python3.9-distutils \
 procps \
 net-tools \
 libc6-i386 \
 wget \
 curl

# Install pip2.7
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip2.7.py
RUN python2.7 get-pip2.7.py

# Install pip3.9
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip3.9.py
RUN python3.9 get-pip3.9.py

# Install python2.7 hacking tools
RUN pip2.7 install capstone
RUN pip2.7 install pwntools
RUN pip2.7 install ropper
RUN pip2.7 install ropgadget

# Install gef
RUN bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
RUN pip3.9 install capstone unicorn keystone-engine ropper
RUN echo "export LC_CTYPE=C.UTF-8" >> /root/.bashrc # Required for fancy gef cli

# Install radare2
RUN wget https://github.com/radareorg/radare2/releases/download/5.7.0/radare2_5.7.0_amd64.deb
RUN dpkg -i radare2_5.7.0_amd64.deb
RUN rm radare2_5.7.0_amd64.deb

# Enable coloured bash
RUN echo "case \"$TERM\" in xterm-color|*-256color) color_prompt=yes;; esac" >> /root/.bashrc

# Custom prompt
RUN echo "export PS1='\[\033[1;36m\]ctf-debian\[\033[0m\]:\[\033[1;35m\]\w\[\033[0m\]$ '" >> /root/.bashrc

# Helper commands
RUN echo "alias ctf=\"cd $HOME/shared/CTFs\"" >> /root/.bashrc

# Set entrypoint and working directory
WORKDIR /root/
