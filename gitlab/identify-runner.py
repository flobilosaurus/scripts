import os
import re
import sys
import gitlab
import boto3
import webbrowser

GITLAB_URL = ''

def extract_ssh_key_id_of_runner(job_url):
    job_id = job_url.split('/')[-1]
    project_name = '/'.join(job_url.split('/')[3:-3])

    gitlab_token = os.environ['GITLAB_TOKEN']
    gitlab_client = gitlab.Gitlab(GITLAB_URL, private_token=gitlab_token)
    project = gitlab_client.projects.get(project_name)
    job = project.jobs.get(job_id)
    trace = job.trace().decode('utf-8')
    runner_id = re.compile("via runner-(.*)...[\r\n]+")
    result = runner_id.search(trace)
    ssh_key_id = result.group(0)[4:-4]
    print(f'job used runner with ssh key: {ssh_key_id}')
    return ssh_key_id

def open_url_to_ec2_instance(ssh_key_id):
    client = boto3.client('ec2')
    response = client.describe_instances(
        Filters=[
            {
                'Name': 'key-name',
                'Values': [ssh_key_id],
            },
        ],
    )
    instance_id = response['Reservations'][0]['Instances'][0]['InstanceId']
    num_instances = len(response['Reservations'][0]['Instances'])
    
    webconsole_url = f'https://eu-central-1.console.aws.amazon.com/ec2/v2/home?region=eu-central-1#InstanceDetails:instanceId={instance_id}'
    print(f'identified ec2 instance: {instance_id} -> {webconsole_url}')
    webbrowser.open(webconsole_url)

if(len(sys.argv) <= 1):
    print('please provide job url:\npython3 identify-runner.py <job_url>')
    exit(-1)

job_url = sys.argv[1]
ssh_key_id = extract_ssh_key_id_of_runner(job_url)
open_url_to_ec2_instance(ssh_key_id)