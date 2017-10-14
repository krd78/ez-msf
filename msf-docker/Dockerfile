FROM debian:stretch

# Required packages
RUN apt-get update && apt-get -y install \
    autoconf bison build-essential \
    curl git-core libapr1 libaprutil1 \
    libcurl4-openssl-dev libgmp3-dev \
    libpcap-dev libpq-dev libreadline6-dev \
    libsqlite3-dev libssl-dev libsvn1 \
    libtool libxml2 libxml2-dev libxslt-dev \
    libyaml-dev locate ncurses-dev \
    openssl postgresql postgresql-contrib \
    wget xsel zlib1g zlib1g-dev nmap

# Compil and install ruby
RUN cd /opt && \
    curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -o rvm.sh -L https://get.rvm.io && \
    bash rvm.sh stable

# Git Metasploit Framework repository
RUN cd /opt && \
    git clone https://github.com/rapid7/metasploit-framework.git msf -o upstream
WORKDIR /opt/msf

ENV PATH=$PATH:/usr/local/rvm/bin/:/usr/local/rvm/rubies/ruby-2.4.2/bin

RUN /bin/bash -c ". /usr/local/rvm/scripts/rvm && rvm --install 2.4.2"

# Install ruby dependencies
RUN gem install bundler && bundle install

# Symlinks
RUN ln -s /opt/msf/msf* /usr/local/bin

# Database config
RUN mkdir /root/.msf4
COPY database.yml /root/.msf4 

USER root

# git settings for msfupdate
RUN git config --global user.name "name"
RUN git config --global user.email "@email"

# don't forget to start postgresql
CMD exec ruby /usr/local/bin/msfconsole
