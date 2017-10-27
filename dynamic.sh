#!/bin/bash
# By, Nikit Swaraj, DevOps Intern, REDHAT INC 2015 
# This Script is used to change the IP of inventory file of ansible script dynamically.
# The dependency of this script is ec2.py, ec2.ini, jq and boto
      HOST_FILE_PATH="$1"
      if [ -f $1 ]
          then
                server1_IP=`python /usr/bin/ec2.py --list | jq '.tag_Name_server1[0]'`
             if [ $? == 0 ]
             then
                #Updating the host file with the new ip of instances
                sed -i '4s/\(ansible_host=\).*/\1'"$server1_IP"'/g' $HOST_FILE_PATH;
             else
                echo “ There is some error occurs during accessing the IP of Instances. Please check the tag name of Instances or ec2.ini file.”
             fi
      fi

