#!/bin/bash

# takes a set of gzipped tar files (process_logs.sh foo.tgz bar.tgz etc) 

# creates a temp scratch directory
mkdir tempDir

#loops over compressed tar files, extracting them into the tempDir and then calls process_client_logs

files="$@"

for file in $files
do
	name=$(echo $file | awk -F"/" '{print $2}' | awk -F"_" '{print $1}')	
	mkdir tempDir/$name
	tar -xf $file -C tempDir/$name
	./bin/process_client_logs.sh tempDir/$name
done


#calls create _username_dist, create_country_dist, and create_hours dist
./bin/create_username_dist.sh tempDir
./bin/create_hours_dist.sh tempDir
./bin/create_country_dist.sh tempDir

#calls _assemble
./bin/assemble_report.sh tempDir

# moves the failed_login_summary.html file from scratch to directory where process_logs called

cp tempDir/failed_login_summary.html $PWD

rm -r tempDir

