#!/bin/bash

# Create ec2 instance
aws ec2 run-instances --image-id ami-0b898040803850657 --count 1 --instance-type t2.micro --iam-instance-profile Name=my-instance-profile --key-name my-key-pair --security-group-ids sg-0a9c9e6c6c6c6c6c6 --subnet-id subnet-0a9c9e6c6c6c6c6c6

# Set variables
BUCKET_NAME="my-bucket"
EC2_INSTANCE_ID="i-0123456789abcdefg"

# Get the instance profile name for the EC2 instance
INSTANCE_PROFILE_NAME=$(aws ec2 describe-instances --instance-ids $EC2_INSTANCE_ID --query 'Reservations[].Instances[].IamInstanceProfile[].Name'
 --output text)

# Get the IAM role name associated with the instance profile
ROLE_NAME=$(aws iam get-instance-profile --instance-profile-name $INSTANCE_PROFILE_NAME --query 'InstanceProfile.Roles[].RoleName' --output text)


# Create a policy from the policy document(s3-policy.json)
POLICY_ARN=$(aws iam create-policy --policy-name s3-access-policy --policy-document file://s3-policy.json --query 'Policy.Arn' --output text)

# Attach the policy to the IAM role
aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn $POLICY_ARN

# Test S3 access from the EC2 instance
aws s3 ls s3://$BUCKET_NAME

# Manipulate the S3 bucket from the EC2 instance
echo "Hello, world!" > test.txt
aws s3 cp test.txt s3://$BUCKET_NAME
aws s3 ls s3://$BUCKET_NAME
aws s3 rm s3://$BUCKET_NAME/test.txt


