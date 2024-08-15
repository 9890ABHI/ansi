git clone https://github.com/9890ABHI/ansi

chmod -R +x ansi

add <key-name.pem>
and give permission
chmod 0400 <key-name.pem>

export AWS_ACCESS_KEY_ID='your-access-key-id'
export AWS_SECRET_ACCESS_KEY='your-secret-access-key'

./invent.sh

ansible-playbook provisioning.yml

ansible-playbook -i inventory playbook.yml

ansible-playbook -i inventory run-ldap-conf.yml

ansible-playbook -i inventory check-services.yml
