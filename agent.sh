#!/bin/sh

# Currently: Looping through presigned URLs w/ wget to get presigned urls and download them - we want to login to the agent and USE agent to get presigned urls
# Currently, we LOOP through and thus download files in a flat structure -- with map, we can retain nested folder structures
# Adding spaces creates a lot of %20 in the filename when the file downloads
pwd
pennsieve agent
pennsieve whoami

# pennsieve dataset use $1
# pennsieve download dataset $1 "/service/data"
# pennsieve version
pennsieve map $1 "~"
# pennsieve pull $2
# pennsieve manifest sync $3


# ls -alh /mnt/efs/output/$2
# timestamp=$(date +%Y%m%d_%H%M%S%Z)
# target_path="${TARGET_PATH:-"output-$timestamp-$2"}"

# pennsieve manifest create /mnt/efs/output/$2 -t $target_path
# pennsieve manifest list 1
# pennsieve upload manifest 1