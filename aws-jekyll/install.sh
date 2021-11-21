#!/bin/bash
sudo hostnamectl set-hostname jekyll
sudo yum update -y
sudo amazon-linux-extras install ruby2.4 -y
sudo yum install ruby ruby-devel -y
sudo yum groupinstall "Development Tools" -y
sudo gem install bundler 
sudo gem install rdoc
sudo gem update --system
sudo gem install jekyll
jekyll new myblog
