cat $1/*/failed_login_data.txt | awk -F" " '{print $5}' > tmpFile1.txt
# gets list of IP Addresses

join <(sort tmpFile1.txt) <(sort etc/country_IP_map.txt) | awk -F" " '{print $2}' | cat > tmp2.txt
# joins the sorted IPs and IP map, grabs just the country code, and puts it in a file
# got info from shapeshed.com/unix-join



sort tmp2.txt | uniq -c | awk -F" " '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > tmpFile2.txt
# sorts the list, counts how many of each username is listed, turns it into "data.addRow(['web7', 16])" format, and dumps it in a tmp file

#This line wraps our username list using the script from the prelab
./bin/wrap_contents.sh tmpFile2.txt html_components/country_dist $1/country_dist.html

#Removing files that are no longer necessary
rm -f tmpFile1.txt tmpFile2.txt tmp2.txt

