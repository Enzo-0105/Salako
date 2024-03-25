#!/bin/bash


#This is to set the instance id 
INSTANCE_ID="i-027e38f2ffdf124c7"

#Check instance status 
instance_status=$(aws ec2 describe-instance-status --instance-ids $INSTANCE_ID --query 'InstanceStatuses[0].InstanceState.Name' --output text)

#To check if it is not running 
if [ "$instance_status" != "running" ]; 
then 
	echo "Instance not running"
#starting the instance 
	aws ec2 start-instances --instance-id $INSTANCE_ID
	echo "Starting instance"
	sleep 4
	echo "Instance Succesfully started and running"
else 
	echo "instance already running"
fi
