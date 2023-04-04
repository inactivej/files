#!/bin/bash

chararray=("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")

read -p "Password lenght:" pswdlenght

password=""

if [ $pswdlenght -gt 0 ]
then
    for i in $(seq 1 $pswdlenght);
    do
        randomindex=$((RANDOM % ${#chararray}))
        password="$password${chararray:$randomindex:1}"
        #${char_set:$random_index:1} je výraz, který vybírá jeden náhodný znak ze stringu char_set. :$random_index:1 znamená, že se z char_set vybere podřetězec o délce 1, začínající na pozici určené náhodným indexem random_index. Tento podřetězec obsahuje právě jeden znak ze char_set, a ten je poté použit pro sestavení hesla.        
    done
    echo "Generating..."
    sleep 5
    echo "Your new password:$password"
else
    echo "Enter valid lenght of password"
fi



