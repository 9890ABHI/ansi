#!/bin/bash

# read -p "Enter key name :  " key_name 

# read -p "Enter image you to give to instances :  " image_name

# read -p "Enter the subnet id :  " subnet_id


# export KEY_NAME=$key_name
# export IMAGE_NAME=$image_name
# export SUBNET_NAME=$subnet_id


export KEY_NAME=boot-1
export IMAGE_NAME=ami-04a81a99f5ec58529
export SUBNET_NAME=subnet-0af822569e9483069

# echo $key_name
# echo $image_name
# echo $subnet_id






ansible-playbook provisioning.yml | tee provision-output.txt



ansible-playbook -i inventory playbook.yml


ansible-playbook -i inventory run-ldap-conf.yml


ansible-playbook -i inventory check-services.yml