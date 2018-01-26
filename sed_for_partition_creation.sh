#!bin/bash/
s3 ls to sed to alter partition command
aws s3 ls s3://paul-seth/example_dropped_data/ --recursive | \
grep '[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9].*' | \
sed "s#.*\([0-9][0-9][0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\).*#PARTITION (year=\1, month=\2, day=\3) location 'paul-seth/example_dropped_data/\1/\2/\3/'#" | \
sort | uniq | \
sed "s#month=0\([1-9]\)#month=\1#; s#day=0\([1-9]\)#day=\1# " > \
partitions_command
