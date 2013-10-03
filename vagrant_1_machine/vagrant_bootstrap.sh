#!/bin/bash
set -e

# If we're detect we're in Moz East, then add the office apt-cache mirror
OFFICE_IP="162.208.42.130"
IP=`wget -q eth0.me -O-`

if [[ "$IP" == "$OFFICE_IP" ]]
then
  echo 'Acquire::http { proxy "http://192.168.42.225:3142"; };' > /etc/apt/apt.conf.d/02proxy
fi

apt-get update
apt-get install -y vim screen curl git-core
