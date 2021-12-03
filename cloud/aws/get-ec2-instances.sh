#!/bin/env bash

PROFILE=$1

aws ec2 --profile ${PROFILE} describe-instances | jq -r '.Reservations[].Instances[]|[(.Tags[]|select(.Key == "Name")|. .Value),.ImageId,.InstanceType,.NetworkInterfaces[].PrivateIpAddress,.KeyName]|@csv' | sed 's/"//g' | column -t -s,
