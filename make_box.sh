#!/usr/bin/env bash
#this script builds a vagrant box and exports it to vagrant-java-docker.box

rm -f ubuntu-java-docker.box
vagrant destroy -f
vagrant up
vagrant halt -f
vagrant package --output ubuntu-java-docker.box