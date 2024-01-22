#!/bin/bash

 # Update and install necessary packages
 sudo yum update -y
 sudo yum install -y git docker java

 # Restart and enable Docker service
 sudo systemctl restart docker
 sudo systemctl enable docker

 # Change to the root directory
 cd /root/

 # Check if Jenkins war file exists
 if [ ! -f "jenkins.war" ]; then
     # Download Jenkins war file if not present
     sudo wget https://get.jenkins.io/war-stable/2.426.2/jenkins.war
 fi

 # Check if Jenkins is already running
 if ! pgrep -f "java -jar jenkins.war" > /dev/null; then
     # Start Jenkins service if not running
   nohup sudo java -jar jenkins.war &
 fi

 # Note: The '&' at the end runs the process in the background

 # Output a message indicating the script has finished
 echo "Jenkins setup script completed."
