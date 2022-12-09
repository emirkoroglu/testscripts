#!/bin/bash

# send a test email using Amazon SES
python3 -c "
import boto3

client = boto3.client('ses')
response = client.send_email(
    Source='verified-email@example.com',
    Destination={
        'ToAddresses': ['test-email@example.com'],
    },
    Message={
        'Subject': {
            'Data': 'Test email from EC2 instance',
        },
        'Body': {
            'Text': {
                'Data': 'This is a test email from an EC2 instance.',
            },
        },
    },
)
"
