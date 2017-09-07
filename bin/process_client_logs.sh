 #!/bin/bash

cd $1

cat var/log/* | grep -e \^\.\*"Failed password"\.\*\$ | grep -e \^\.\*"invalid user"\.\*\$ | awk -F" " '{print $1 " " $2 " " $3 " " $11 " " $13}' | awk -F":" '{print $1 " " $3}' | awk -F" " '{print $1 " " $2 " " $3 " " $5 " " $6}' > tmpFile.txt
#This works for all attempts with invalid users, but not with valid users

cat var/log/* | grep -e \^\.\*"Failed password"\.\*\$ | grep -ve \.\*"invalid user"\.\*\$ | awk -F" " '{print $1 " " $2 " " $3 " " $9 " " $11}' | awk -F":" '{print $1 " " $3}' | awk -F" " '{print $1 " " $2 " " $3 " " $5 " " $6}' > tmpFile2.txt

cat tmpFile.txt tmpFile2.txt > failed_login_data.txt

rm tmpFile.txt tmpFile2.txt

