#!/usr/bin/env bash
#bootstrap ubuntu box with docker

#use german mirrors for more speeeeeeed
sed -i 's/archive.ubuntu.com/de.archive.ubuntu.com/' /etc/apt/sources.list

apt-get update
apt-get install moreutils -y

#DOCKER
#docker installation
curl -sSL https://get.docker.com/ | sh

#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#JAVA
#automated java 8 installation
#-> http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
add-apt-repository ppa:webupd8team/java -y
apt-get update
#auto-accept licence
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install oracle-java8-installer oracle-java8-set-default -y

#trim down Vagrant box
#-> https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

apt-get clean -y
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

cat /dev/null > ~/.bash_history && history -c