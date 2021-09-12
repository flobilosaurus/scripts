import boto3
import time
import re
client = boto3.client('ssm')

EC2_RUNNER_NAME = ''

for i in range(100):
    
    response = client.send_command(
        Targets=[
            {
                'Key': 'tag:Name',
                'Values': [
                    EC2_RUNNER_NAME,
                ]
            },
        ],
        DocumentName='AWS-RunShellScript',
        DocumentVersion='1',
        Parameters={
            'workingDirectory': [
                '',
            ],
            'executionTimeout': [
                '3600',
            ],
            'commands': [
                'df /dev/root',
            ]
        }
    )

    commandId = response['Command']['CommandId']

    time.sleep(5)

    invocations = client.list_command_invocations(
        CommandId=commandId,
        MaxResults=30,
        Details=True
    )

    occupiedSpace = {}
    for invocation in invocations['CommandInvocations']:
        output = invocation['CommandPlugins'][0]['Output']
        splitted = re.split('\s+', output)
        if(len(splitted)>=12):
            occupiedSpace[invocation['InstanceId']] = splitted[11]
        else:
            print(invocation)
    t = time.localtime()
    current_time = time.strftime("%H:%M:%S", t)
    print(f'[{current_time}]')
    for id, occupied in occupiedSpace.items():
        print(f'{occupied}\t https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1#InstanceDetails:instanceId={id}')
    time.sleep(600)
    