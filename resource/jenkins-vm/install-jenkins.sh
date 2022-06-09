#!/bin/bash
sudo apt -y update && sudo apt -y upgrade
echo "Create Folder"
mkdir tes
echo "Create Install Java"
echo "y" | apt-get install openjdk-8-jdk
echo "y" | apt-get install nginx
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins