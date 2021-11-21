#!/bin/bash

# Format:  
# ./as.sh 3
# ./as.sh 0

elb_json="elb.json"
web_json="web.json"

if [ "$1" -eq 0 ] 
then
        aws route53 change-resource-record-sets --hosted-zone-id Z16AGEC3IMI3R8 --change-batch file://$web_json --profile tfc
else
	aws route53 change-resource-record-sets --hosted-zone-id Z16AGEC3IMI3R8 --change-batch file://$web_json --profile tfc
fi

int=$1

aws autoscaling update-auto-scaling-group \
--auto-scaling-group-name livestream-web-asg \
--min-size $int \
--max-size $int \
--desired-capacity $int \
--region us-east-2 \
--profile tfc
