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

# echo $key_name
# echo $image_name
# echo $subnet_id




ansible-playbook provisioning.yml | tee provision-output.txt


sleep 100
# # Extract instance IDs from the output file
# instance_ids=$(grep 'instance_id' "$output_file" | awk -F"'" '{print $2}')

# # Define a function to check if all instances are running
# check_instances_running() {
#     local instance_ids="$1"
#     local all_running=true

#     for instance_id in $instance_ids; do
#         # Check the instance status
#         status=$(aws ec2 describe-instances --instance-ids "$instance_id" --query "Reservations[*].Instances[*].State.Name" --output text)

#         if [ "$status" != "running" ]; then
#             all_running=false
#             break
#         fi
#     done

#     echo $all_running
# }

# # Wait until all instances are running
# echo "Waiting for all instances to be running..."
# while true; do
#     if [ "$(check_instances_running "$instance_ids")" == "true" ]; then
#         echo "All instances are running."
#         break
#     else
#         echo "Not all instances are running yet. Checking again in 30 seconds..."
#         sleep 30
#     fi
# done


ansible-playbook -i inventory playbook.yml


ansible-playbook -i inventory run-ldap-conf.yml


ansible-playbook -i inventory check-services.yml