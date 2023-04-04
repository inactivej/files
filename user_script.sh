#!/bin/bash
function adduser()
{  
    user_input
    user=$var
    path=$(cut -f1 -d":" /etc/passwd|grep -w "$user")  
    if [ -z $path ]
    then
        sudo useradd -m $user
        read -p "Enter new password for user $user:" password          
        echo "$user:$password"|sudo chpasswd
        sleep 3
        echo "User has been created"
    else     
        echo "User already exists"
    fi
}
function user_input()
{
    read -p "Enter user name:" var
}
function user_not_found()
{
    echo "User doesn't exists"
    read -p "Do you want to create this user? Y/N" var2
}
function deluser()
{
    user_input
    user=$var #odkazuje na funkci user_input
    choice2=$var2 #okazuje na funkci user_not_found
    path=$(cut -f1 -d":" /etc/passwd|grep -w "$user")
    if [ -z $path ]
    then
        user_not_found
        if [[ "$choice2" == "Y" ]] 
        then
            adduser
        else
            echo "Ok"
            read 3            
        fi
    else
        sudo userdel -r -f $user
        sleep 3
        echo "User has been deleted"    
    fi  
}
echo "1...Add user"
echo "2...Delete user"
read -p "Choice:" input

case "$input" in
    1)
        adduser $var
    ;;
    2)
        deluser $var
    ;;
esac

