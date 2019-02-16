# Demo to create a NAT Gateway.

After provisioning the stack, you can try out the demo with the following commands

```
eval $(ssh-agent)
ssh-add ${PATH_TO}/AwsDemoKeyPair.pem
ssh -A ec2-user@<BASTION_HOST_PUBLIC_IP>

# On the bastion host
ssh -A ec2-user@<PRIVATE_EC2_INSTANCE_1>
curl -v http://www.index.hu # A meaningful HTTP redirect response is returned.
exit

ssh -A ec2-user@<PRIVATE_EC2_INSTANCE_2>
curl -v http://www.index.hu # A meaningful HTTP redirect response is returned.
exit
```
