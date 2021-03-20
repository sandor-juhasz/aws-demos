# Demo to create a NAT Gateway.

To enable Session Manager, you need to specify
1) Instance profile with permissions
2) Running ssm agent on the host you are trying to access.
3) Session Manager Plugin on the machine you are running the CLI from.

After provisioning the example stack, you can try out the demo with the
following commands:

1. First you need to have AWS CLI 2 and the Session Manager Plugin for the AWS
   CLI. Please follow this link for instructions.

   https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

2. Once ready, you can open a terminal session by

   a) opening the AWS Management console, selecting the instance from the EC2
      console and clicking Connect

   b) executing the CLI, with the command
      ```
      aws ssm start-session \
          --target i-09269996f77d4ea9e   # Update the instance ID!
      ```

   In both cases the session will be started as the "ssm-user" who can sudo to
   "ec2-user".

3. Session manager supports port forwarding to the target EC2 instance. Execute
   the following command to foward SSH to the localhost:2222
   ```
   aws ssm start-session \
       --target i-09269996f77d4ea9e \    # Update the instance ID!
       --document-name AWS-StartPortForwardingSession \
       --parameters '{"portNumber":["22"],"localPortNumber":["2222"]}'
   ```

   Later you can connect with
   ```
   ssh -i AwsDemoKeyPair.pem \
       -p 2222 '
       ec2-user@localhost
   ```
      
4. Session manager sessions cannot be opened or used to forward services
   accessed through private VPC Endpoints. Examples: Private APIs running on
   API Gateway or an ElasticSearch Service instance. To access these
   services remotely, we need a bastion (jump host) running SSH.

   1) The traditional way to utilize a bastion is to start it in a public
      subnet and create a tunnel there.

   2) With Session manager the bastion can run in the private subnet.


      1. Open local port forwarding to the jump host's port 22.
      
         ```
         aws ssm start-session \
             --target i-09269996f77d4ea9e \
             --document-name AWS-StartPortForwardingSession \
             --parameters '{"portNumber":["22"],"localPortNumber":["2222"]}'
         ```
      
      2. Now create the tunnel to the service accessed through the ENI or other
         private resource. (192.168.3.144 in this example)
         ```
         ssh -i AwsDemoKeyPair.pem \
             -L 3333:192.168.3.144:80 \
             -p 2222 '
             ec2-user@localhost
         ```
         
         Prompt is displayed, tunnel is opened in the background.
      
      3. Open http://localhost:3333 in your browser.


