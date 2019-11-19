import requests
from requests_aws_sign import AWSV4Sign
from boto3 import session

def get_assets():
    """https://github.com/jmenga/requests-aws-sign"""
    
    print("Getting assets")

    s = session.Session()
    credentials = s.get_credentials()
    region = s.region_name or 'us-east-1'
           
    uri = "https://wl99lxt81i.execute-api.us-east-1.amazonaws.com/Prod/assets"
    service = 'execute-api'
    auth=AWSV4Sign(credentials, region, service)
    response = requests.get(uri, auth=auth)
    print(response.status_code)
    print(response.content)
    print("Done.")
