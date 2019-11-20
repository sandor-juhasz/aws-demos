import json

def assets_handler(event, context):
    return {
        "statusCode": 200,
        "body": json.dumps({
            "assets": [
                {"name": "people"},
                {"name": "addresses"}
            ]
        })
    }
