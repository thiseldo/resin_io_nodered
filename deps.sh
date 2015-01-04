#!/bin/bash

set -o errexit

apt-get -q update
apt-get -q -y upgrade
apt-get -q -y install python build-essential python-dev python-pip
# Install python modules
#pip install RPi.GPIO
dpkg -i python-rpi.gpio_0.5.8-1_armhf.deb

git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..
git clone https://github.com/node-red/node-red.git
cd node-red
cd nodes
git clone https://github.com/node-red/node-red-nodes.git
cd ..
npm install wiring-pi
npm install js2xmlparser
npm install serialport
npm install feedparser
npm install --production

cp -f ../settings.js .
cp -f ../flows_raspberrypi.json .
