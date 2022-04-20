#!/bin/bash
file=$(cat $1)

for line in $file
do
  aws ec2 stop-instances --instance-ids "$line" --region us-east-1
  aws ec2 wait instance-stopped --instance-ids "$line" --region us-east-1
  #encryptomatic
  ./ec2cryptomatic run -i "$line" -r us-east-1 -s true
done
