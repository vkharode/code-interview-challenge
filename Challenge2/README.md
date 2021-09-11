# Get aws metadata in json output

## What it does
- Query the metadata of an ec2 instance within AWS and provide a json formatted output. 
- Retrieve the value of a particular data key.

## How to install
- [Create an EC2 Linux instance on AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
- [SSH into the instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
- Install Python 3 and git on your instance 
    - `sudo yum install python3`
- Install pipenv
  - `sudo pip3 install pipenv`
- Install project dependancies
  - `pipenv install`


## How to run
- Run whichever script you need:
  - `python3 get_metadata.py`

## Note
- Instance metatada is provided at this link, but only when you visit it from a running instance.