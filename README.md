# ansi







add you key

ansible.cfg




so i have created a project name as Automated HPC cluster using AWS  
in that project first i have created one control instance using ec2 instance
then i have created a file name as provisioning in that file it will create one master instance and two compute instance with ubuntu as OS and some required packages install in those instances 
after that i have install SLURM as HPC tool in those instance like i have install SLURM using manual install like download its tar file then 
untar the file anf then configure , make and make install so that it will install slurm in all instance 
after that i have created on file for configuration file that will store in all instances after that start and check all services like in master slurmctld and on compute slurmd 
then after that install the nagios to monitor all the instances so that we can get an overview about how many resources are using by those instances
all these configration , provisioning are manage by ansible so that all services install and check thoses services 