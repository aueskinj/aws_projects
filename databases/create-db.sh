#!/bin/bash

<<Task
Setting up a highly available MySQL database, Amazon RDS to store data for a customer facing website 
Task


# Create security group
aws ec2 create-security-group --group-name db-security-group --description "Database Security Group"
security_group_id=$(aws ec2 describe-security-groups --group-names db-security-group --query 'SecurityGroups[0].GroupId' --output text)

# Create subnet group
aws rds create-db-subnet-group --db-subnet-group-name db-subnet-group --db-subnet-group-description "Database Subnet Group" --subnet-ids subnet-1 subnet-2
subnet_group_name="db-subnet-group"

# Create RDS instance
aws rds create-db-instance --db-instance-identifier mydbinstance --db-instance-class db.t2.micro --engine MySQL --allocated-storage 20 --master-username admin --master-user-password adminpassword --vpc-security-group-ids $security_group_id --db-subnet-group-name $subnet_group_name --availability-zone us-west-2a

# Create EC2 instance
aws ec2 run-instances --image-id ami-123456 --count 1 --instance-type t2.micro --key-name mykey --security-group-ids $security_group_id --subnet-id subnet-1 --user-data file://userdata.txt

# Create read replica
aws rds create-db-instance-read-replica --db-instance-identifier myreadreplica --source-db-instance-identifier mydbinstance --db-instance-class db.t2.micro --availability-zone us-west-2b --no-publicly-accessible --db-subnet-group-name $subnet_group_name

# Create web server
aws ec2 run-instances --image-id ami-789012 --count 1 --instance-type t2.micro --key-name mykey --security-group-ids $security_group_id --subnet-id subnet-2 --user-data file://userdata.txt

