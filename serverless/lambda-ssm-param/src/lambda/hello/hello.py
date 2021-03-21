import os
import boto3

def lambda_handler(event, context):
    client = boto3.client('ssm')
    param_details = client.get_parameter(Name='/demo/lambda-ssm-param/helloMessage')
    print(param_details)
    
    print(param_details["Parameter"]["Value"])
    return None
