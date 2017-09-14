#!/bin/bash

cat $1/country_dist.html $1/hours_dist.html $1/username_dist.html > temp.txt
# cat the files into one file

./bin/wrap_contents.sh temp.txt html_components/summary_plots $1/failed_login_summary.html
# wrap the file in html and make it the correct file

rm temp.txt
#remove unnecessary file



