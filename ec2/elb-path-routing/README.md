# Elastic Load Balancer Demo 3

The purpose of this demo is to create an Application Load Balancer in a public
subnet and register EC2 instances running Apache HTTPD with different contents.
Route requests with path /demo1/ to the first instance, with /demo2/ to the
second.

## Exercise 1

Create a CloudFormation template which fulfill the following requirements:

- Create a VPC with two public subnets in two availability zones.

- Create an application load balancer
  - Spanning these two subnets
  - Listening on port 80
  - Protected by a security group and letting in HTTP traffic from port 80 only.
  - Target group web, port 80.
  
- Set up two EC2 instances
  - One in each subnet.
  - Use Amazon Linux 2 AMI
  - Use t2.micro instance type
  - Assign public IP to both
  - Use the AwsDemo keypair for both.
  - Protect the instances with a security group with the following policies:
    - HTTP traffic to port 80 is allowed only from the application load balancer
    - SSH traffic is allowed from around the world.
  - Execute the following script as user data
    ```
    #!/bin/bash
    yum install httpd -y
    service httpd start
    echo 'Hello Cloud Guru!, Demo App 1' >/var/www/html/index.html
    ```


After successful provisioning, hit the following URLs using curl:

http://alb-<this-will-change>.us-east-1.elb.amazonaws.com/
http://alb-<this-will-change>.us-east-1.elb.amazonaws.com/demo1/
http://alb-<this-will-change>.us-east-1.elb.amazonaws.com/demo2/

