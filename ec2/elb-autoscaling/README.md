# Elastic Load Balancer Demo 2

The purpose of this demo is to create an Application Load Balancer in a public
subnet and register EC2 instances running Apache HTTPD using autoscaling.

## Exercise 2

Create a CloudFormation template which fulfill the following requirements:

- Create a VPC with two public subnets in two availability zones.

- Create an application load balancer
  - Spanning these two subnets
  - Listening on port 80
  - Protected by a security group and letting in HTTP traffic from port 80 only.
  - Target group web, port 80.
  - Set up ELB health monitoring.
  
- Create an autoscaling launch configuration
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
    echo 'Hello Cloud Guru!' >/var/www/html/index.html
    ```
    
- Register the instances as targets.

- Create an Autoscaling Group
  - Set up two EC2 instances and keep the number of instaces as 2.
  - Set up one in each subnet.
  - Use ELB health check monitoring.


Once the stack is started and ready, log into one of the nodes and
stop the httpd. Monitor the healthcheck and watch as the node gets
replaced with a new one.