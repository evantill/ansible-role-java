#!/bin/bash

docker run \
    --name="oraclelinux7-ansible" \
    --detach \
    --privileged \
    --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro \
    --volume=`pwd`/..:/etc/ansible/roles/geerlingguy.java:ro \
    evantill/docker-oraclelinux7-ansible:latest 

docker exec -it oraclelinux7-ansible ansible-playbook /etc/ansible/roles/geerlingguy.java/test/playbook.yml
    
docker stop oraclelinux7-ansible

docker rm oraclelinux7-ansible