#!/usr/bin/env bash

# Program name:  show-cidr-ranges.sh
#
# This scripts takes ~/.aws/credentials entries as command
# line inputs, and lists all the CIDR ranges in all the 
# regions in those accounts
# 
# e.g.:
# show-cidr-ranges awsrootacc training odm devcloud
#
#cidr_range_of=cidr-ranges_`date +%Y-%m-%d-%H.%M.%S`.txt
timestamp=`date +%Y-%m-%d-%H.%M.%S`
cidr_range_of=cidr-ranges_$timestamp.txt
cidr_range_of_uniq=cidr-ranges_uniq_$timestamp.txt
cat /dev/null > $cidr_range_of
for account in "$@"
do
    for region in `aws ec2 describe-regions --profile $account | jq -rC '.Regions[].RegionName' | sort`
    do
        echo -n .
        aws ec2 describe-subnets --profile $account --region $region | jq -rC '.Subnets[].CidrBlock' | sort >> $cidr_range_of
    done
done
sort $cidr_range_of > temp.txt
uniq temp.txt > $cidr_range_of_uniq
sleep 1
rm temp.txt
echo
echo $0 is finished
