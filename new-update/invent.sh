#!/bin/bash

echo "install dependancy for control node "

apt update && apt upgrade
apt install python3-pip -y
apt install python3-boto -y  && apt install python3-boto3 -y
apt install ansible -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# read -p "Enter key name :  " key_name 
# read -p "Enter image you to give to instances :  " image_name
# read -p "Enter the subnet id :  " subnet_id

# export KEY_NAME=$key_name
# export IMAGE_NAME=$image_name
# export SUBNET_NAME=$subnet_id


export KEY_NAME=boot-1
export IMAGE_NAME=ami-04a81a99f5ec58529
export SUBNET_NAME=subnet-0af822569e9483069

echo "provisioning instances"
ansible-playbook provisioning.yml | tee provision-output.txt



echo "all instance should be up and running"
sleep 100


echo "install ssh key and passwordless ssh"
ansible-playbook -i inventory install-ssh.yml

echo "install slurm"
ansible-playbook -i inventory install-slurm.yml

echo "install ldap"
ansible-playbook -i inventory install-ldap.yml

echo "install nagios"
ansible-playbook -i inventory install-nagios.yml

echo "check services"
ansible-playbook -i inventory check-services.yml
