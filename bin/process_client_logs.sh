 #!/bin/bash

cd $1

#Places all attempts on invalid users into a file
cat var/log/* | grep -e \^\.\*"Failed password"\.\*\$ | grep -e \^\.\*"invalid user"\.\*\$ | awk -F" " '{print $1 " " $2 " " $3 " " $11 " " $13}' | awk -F":" '{print $1 " " $3}' | awk -F" " '{print $1 " " $2 " " $3 " " $5 " " $6}' > tmpFile.txt

#Places all attempts with valid users, but wrong passwords into a different file
cat var/log/* | grep -e \^\.\*"Failed password"\.\*\$ | grep -ve \.\*"invalid user"\.\*\$ | awk -F" " '{print $1 " " $2 " " $3 " " $9 " " $11}' | awk -F":" '{print $1 " " $3}' | awk -F" " '{print $1 " " $2 " " $3 " " $5 " " $6}' > tmpFile2.txt

#concatenates the two files into the final, desired one
cat tmpFile.txt tmpFile2.txt > failed_login_data.txt

rm tmpFile.txt tmpFile2.txt

