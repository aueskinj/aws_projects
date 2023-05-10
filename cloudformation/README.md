# task.json 
*Create a Cloud Formation template that provisions a VPC with its necessary components and an EC2 instance within the VPC.*

### Step One
Define the VPC and its components - subnets
                                  - route tables
                                  - security groups.
### Step two
Define an EC2 instance
Specify: - instance type
         - AMI
         - security group.

### Step three
Define - VPC ID
       - subnet ID
       - security group ID.

### Step four
Define internet gateway or NAT gateway.

##After doing the above;
> Specify EC2 instance you want to create, security group for that instance, and a subnet that the instance can reside in.
> Specify specific ports and protocols, and the subnet associated with  particular route table.
> Add the scpefications to CloudFormation template as a set of nested stacks.
When you launch your CloudFormation stack, AWS will automatically creates all of the resources you defined,
in the order specified by the dependencies you have defined.
