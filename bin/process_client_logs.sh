 #!/bin/bash

#Failed password OR invalid user
# grep secure -e "Failed password\|Invalid user" does some stuff
# > failed_login_data.txt

#  grep -e \^\.\*"Failed password"\.\*\$ -o * | awk -F":" '{print $2}'
#  ^ does things better


