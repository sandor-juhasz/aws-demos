import requests
from requests_aws_sign import AWSV4Sign
from boto3 import session
import sys

def call_protected_api():
    """https://github.com/jmenga/requests-aws-sign"""
    
    print("Getting assets")

    s = session.Session()
    credentials = s.get_credentials()
    region = s.region_name or 'us-east-1'
           
    uri = sys.argv[1]
    service = 'execute-api'
    auth=AWSV4Sign(credentials, region, service)
    response = requests.get(uri, auth=auth)
    print(response.status_code)
    print(response.content)
    print("Done.")
