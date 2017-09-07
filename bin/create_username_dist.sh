#!/bin/bash

cat $1/*/failed_login_data.txt | awk -F" " '{print $4}' > tmpFile1.txt
# gets list of users
sort tmpFile1 | uniq -c | data.addRow([$2, $1])sort tmpFile1 | uniq -c | awk -F" " '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > tmpFile2.txt
# sorts the list, counts how many of each username is listed, turns it into "data.addRow(['web7', 16])" format, and dumps it in a tmp file

./bin/wrap_contents.sh tmpFile2.txt html_components/username_dist $1/username_dist.html





