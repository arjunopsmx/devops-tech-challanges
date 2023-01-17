# This script gets twill query the meta data of an ec2 instance.
# Allows for a particular data key to be retrieved individually

#!/bin/bash

readinstanceid(){
## Read ec2 instance id
echo -n "EC2 instance id: "
while read instanceid; do
  test "$instanceid" != "" && break
  echo ""
  echo "                   INFO: INSTANCE ID VALUE CANNOT BE BLANK!"
  echo ""
  echo -n "EC2 instance id: "
done
}


readinstanceregion(){
## Read ec2 instance id
echo -n "EC2 instance region: "
while read instanceregion; do
  test "$instanceregion" != "" && break
  echo ""
  echo "                   INFO: INSTANCE REGION VALUE CANNOT BE BLANK!"
  echo ""
  echo -n "EC2 instance region: "
done
}


readdatakey(){
## Read attribute parameter value to fetch from instance meta data
echo -n "Data key to be retrieved: "
while read datakey; do
  test "$datakey" != "" && break
  echo ""
  echo "                    INFO: DATA KEY VALUE CANNOT BE BLANK!"
  echo ""
  echo -n "Data key to be retrieved: "
done
}

echo ""
echo "----------------------------------------------------------"
echo "Make sure you did aws configure before running this script"
echo "----------------------------------------------------------"
echo ""
readinstanceid
readinstanceregion
echo ""
echo "https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instance-attribute.html <--- you can get the list of data key values under attributes"
echo ""
readdatakey
aws ec2 describe-instance-attribute --instance-id $instanceid --attribute $datakey --region $instanceregion --output json

