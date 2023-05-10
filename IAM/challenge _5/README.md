
# iam_role.sh (AWS EC2 S3 Access)

This is a Bash script that creates an EC2 instance and configures permissions to access an S3 bucket.

## Prerequisites

- AWS CLI installed
- AWS account with permissions to create EC2 instances and IAM policies
- An existing S3 bucket

## Usage

- Set the BUCKET_NAME and EC2_INSTANCE_ID variables at the beginning of the script.
- Save the script as a .sh file.
- Run the script in your terminal.

## What the script does

- Creates an EC2 instance using the specified AMI, instance type, IAM instance profile, key pair, security group, and subnet.
- Retrieves the instance profile name associated with the EC2 instance.
- Retrieves the IAM role name associated with the instance profile.
- Creates an IAM policy from the s3-policy.json file.
- Attaches the policy to the IAM role.
- Tests S3 access from the EC2 instance.
- Manipulates the S3 bucket from the EC2 instance.

`Note: It's important to ensure that you have set up the prerequisites and that you have updated the BUCKET_NAME and EC2_INSTANCE_ID variables before running the script`
