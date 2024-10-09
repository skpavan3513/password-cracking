# password-cracking
team of PU
his is a simple and effective script to crack password hashes using a provided wordlist. It supports different hashing algorithms such as SHA-256, SHA-512, and MD5.
Usage

    Ensure you have the necessary dependencies installed:

        hashid for identifying the hash type.

        john for cracking /etc/shadow hashes.

        Standard command-line tools like sha256sum, sha512sum, md5sum, awk.

    Run the script:

    ./script_name.sh

    Follow the prompts to provide:

        Whether the hash is from /etc/shadow (Y/N).

        The password hash (if not from /etc/shadow).

        The wordlist file where the password exists.

        The text file containing the hash (if from /etc/shadow).

Example
For a manually provided hash:
bash

IS THE HASH FROM /etc/shadow (Y/N) = N
ENTER THE PASSWORD HASH = examplehash
ENTER THE WORDLIST FILE IN WHICH PASSWORD EXIST = /path/to/wordlist.txt

For a hash from /etc/shadow:
bash

IS THE HASH FROM /etc/shadow (Y/N) = Y
ENTER THE WORDLIST IN WHICH PASSWORD EXIST = /path/to/wordlist.txt
ENTER THE TEXT FILE IN WHICH HASH EXIST = /path/to/shadowfile.txt

Features

    Hash Identification: Automatically identifies the type of hash provided.

    Supports Multiple Algorithms: SHA-256, SHA-512, MD5.

    Error Handling: Checks if wordlist file exists and handles unsupported algorithms gracefully.

    John the Ripper Integration: Uses John the Ripper for cracking /etc/shadow hashes.
