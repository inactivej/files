#!/bin/bash

usermaker()
{ 
    #input
    user=$var1
    path=$var2
    #create user
    sudo useradd -m $user
    read -p "Enter new password for user $path:" password    
    echo "$user:$password"|sudo chpasswd    
    #user rights
    sudo chmod 755 /home/$user
}
read -p "User:" var1
var2=$(cut -f1 -d":" /etc/passwd|grep -w "$var1")
if [ -z $var2 ]
then
    usermaker
    else
        echo "User does already exist"        
fi