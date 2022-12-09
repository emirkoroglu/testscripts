#!/bin/bash

# set the command you want to run here
command="add the command"

# get the output of the command and save it to a variable
output=$(eval $command)

# set the email address you want to send the output to here
email="addyouremail"

# send the email with the command output using Amazon SES
python3 -c "
import boto3

client = boto3.client('ses')
response = client.send_email(
    Source='ec2@example.com',
    Destination={
        'ToAddresses': ['$email'],
    },
    Message={
        'Subject': {
            'Data': 'Test output',
        },
        'Body': {
            'Text': {
                'Data': '$output',
            },
        },
    },
)
"
