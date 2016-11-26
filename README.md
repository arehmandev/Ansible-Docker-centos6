## Centos 6 docker container to test ansible scripts

Instructions to build
```
1. Clone this repo
2. Run build.sh (e.g. bash build.sh)
```

Instructions to use

```
docker run -it ansibletest ansible-playbook youransiblefolder/yourplaybook.yml
####
or if you prefer volumes, add your playbook to the ./ansible folder
####
docker run -it -v $PWD/ansible:/ansible ansibletest
```

#Note:
 Make sure your ansible folder is structured correctly e.g.:
├── roles
│   ├── git
│   ├── nginx
│   ├── php
│   ├── python
│   ├── redis
│   └── yum_repos_d
├── setup..retry
└── setup.yml

This container is designed to execute the foremost .yml file e.g. setup.yml
If structured properly this should execute the full playbook

