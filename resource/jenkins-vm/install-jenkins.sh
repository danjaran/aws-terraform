#!/bin/bash
#### debug or check progress in /var/log/messages
sudo yum -y update && sudo yum -y upgrade
sudo yum install git -y
sudo yum install java-1.8.0-openjdk-devel -y
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins




#ubuntu 18.04
# sudo apt -y update && sudo apt -y upgrade
# echo "Create Folder"
# mkdir tes
# echo "Create Install Java"
# echo "y" | apt-get install openjdk-8-jdk
# echo "y" | apt-get install nginx
# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# apt-get update
# apt-get install jenkins