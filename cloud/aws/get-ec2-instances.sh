#!/bin/env bash

JSON=$(aws ec2 $@ describe-instances 2>&1)

[ $? -ne 0 ] && echo "Error retrieving instances [$?]: $JSON"

echo $JSON | jq -r '.Reservations[].Instances[]|[(.Tags[]|select(.Key == "Name")|. .Value),.ImageId,.InstanceType,.NetworkInterfaces[].PrivateIpAddress,.KeyName]|@csv' | sed 's/"//g' | column -t -s,
