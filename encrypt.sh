#!/bin/bash
# encrypt files with aes-256-cbc cipher using openssl

#encrypt files
if [ "$1" == "-e" ];
then
    if [ -f "$2" ];
    then
        openssl aes-256-cbc -a -e -salt -in "$2" -out "$2.aes"
        # if no error occured then print new file name
        if [ $? -eq 0 ];
        then
            echo "Encrypted file: $2.aes"
        else
            echo "Error: Could not encrypt file!"    
        fi
    else
       echo "This file does not exist!" 
    fi
#decrypt files
elif [ "$1" == "-d" ];
then
    if [ -f "$2" ];
    then
        openssl aes-256-cbc -a -d -salt -in "$2" -out "$2.decrypt"
        #if error occured then show error message
        if [ $? -eq 0 ];
        then
            echo "Decrypted file: $2.decrypt"
        else
            echo "Error: Could not decrypt file! Check password!"
            rm "$2.decrypt"
        fi
    else
        echo "This file does not exist!" 
    fi
#show help
else 
    echo "This software uses openssl for encrypting files with the aes-256-cbc cipher"
    echo "Usage for encrypting: ./encrypt -e [file]"
    echo "Usage for decrypting: ./encrypt -d [file]"
fi