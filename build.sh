#!/bin/bash

docker build --no-cache -t ansibletest .

# Instructions:
# Make sure your ansible folder is structured correctly e.g.:
#├── roles
#│   ├── git
#│   ├── nginx
#│   ├── php
#│   ├── python
#│   ├── redis
#│   └── yum_repos_d
#├── setup..retry
#└── setup.yml
#
#This container is designed to execute the foremost .yml file e.g. setup.yml
#If structured properly this should execute the full playbook

# Run instructions:
# docker run -it ansibletest ansible-playbook youransiblefolder/yourplaybook.yml
# or insert as a volume
# docker run -it -v $PWD/ansible:/ansible ansibletest


