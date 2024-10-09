#!/bin/bash
# Check if the correct number of arguments is provided
read -p "IS THE HASH FROM /etc/shadow (Y/N) = " rudhra
if [[ "$rudhra" == "N" ]]; then
    read -p "ENTER THE PASSWORD HASH = " password_hash
    hashid $password_hash
    read -p "ENTER THE WORDLIST FILE IN WHICH PASSWORD EXIST = " wordlist

    # Check if the wordlist file exists
    if [ ! -f "$wordlist" ]; then
        echo "Wordlist file not found!"
        exit 1
    fi

    # Function to generate the hash of a password
    generate_hash() {
        local password=$1
        local algorithm=$2
        case $algorithm in
            sha256)
                echo -n "$password" | sha256sum | awk '{print $1}'
                ;;
            sha512)
                echo -n "$password" | sha512sum | awk '{print $1}'
                ;;
            md5)
                echo -n "$password" | md5sum | awk '{print $1}'
                ;;
            sha2)
                echo -n "$password" | sha2sum | awk '{print $1}'
                ;;
            sha)
                echo -n "$password" | shasum | awk '{print $1}'
                ;;
            *)
                echo "Unsupported algorithm: $algorithm"
                exit 1
                ;;
        esac
    }

    # Attempt to crack the password
    while IFS= read -r password; do
        for algorithm in sha256 sha512 md5; do
            hash=$(generate_hash "$password" "$algorithm")
            if [ "$hash" == "$password_hash" ]; then
                echo ""
                echo -e "PASSWORD CRACKED: \e[1;31m $password\e[0m"
                echo "Algorithm used: $algorithm"
                exit 0
            fi
        done
    done < "$wordlist"

    echo ""
    echo "Password not found in the provided wordlist."
    exit 1
else
    read -p "ENTER THE WORDLIST IN WHICH PASSWORD EXIST = " b
    read -p "ENTER THE TEXT FILE IN WHICH HASH EXIST = " a
    john --wordlist=$b $a
fi
