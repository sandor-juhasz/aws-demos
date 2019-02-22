import os
import boto3

def lambda_handler(event, context):
    for record in event['Records']:
        if record['eventSource'] == 'aws:s3' and record['eventName'] == 'ObjectCreated:Put':
            bucket = record['s3']['bucket']['name']
            key = record['s3']['object']['key']
            s3 = boto3.resource('s3')
            obj = s3.Object(bucket, key)
            contents=obj.get()['Body'].read().decode('utf-8').upper()
            print("New object:" + ' Bucket: '+ bucket + ' Object: '+ key)
            print("Contents: "+contents)
            
            upCaseObject = s3.Object(bucket, 'converted/'+key[7:])
            upCaseObject.put(Body=contents)
            
    return None
