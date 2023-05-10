# DATABASE BASED TASKS

## CREATE_DB.SH

```
Create security groups: Create security groups to control access to the database servers. Make sure to only allow access from the necessary IP addresses and protocols.

Create subnet groups: Create subnet groups for the database servers in each region. Ensure that the subnets are in different availability zones to provide high availability.

Create an RDS instance: Create a MySQL Amazon RDS DB instance. Configure it to use the security group and subnet group you created in steps 1 and 2, respectively.

Create an EC2 instance: Create an Amazon Elastic Compute Cloud (Amazon EC2) instance that runs a PHP website to connect to the database server. Configure it to use the security group and subnet group you created in steps 1 and 2, respectively.

Create a read replica: Create a read replica of the database in another region for disaster recovery. Configure it to use a different subnet group in a different availability zone.

Create a web server: Create a web server in the second region to test access to the read replica. Configure it to use the appropriate security group and subnet group.
```