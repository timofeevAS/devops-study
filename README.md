# devops-study
My study repository for devops tasks.


## Lab 4
```
Deploy
#!/usr/bin/env bash
echo "Usage openstack credentials"
source $HOME/openstack.sh
IP_ADDR_VALUE=$(openstack server show timofeev-instance -c addresses -f value | grep -oP "'\K[0-9.]+(?=')")
JAR_PATH="${WORKSPACE}/target/taskbot-1.0-SNAPSHOT-jar-with-dependencies.jar"
echo $IP_ADDR_VALUE
scp -i ~/.ssh/secret "${JAR_PATH}" "ubuntu@${IP_ADDR_VALUE}":/home/ubuntu/taskbot.jar
ssh "ubuntu@${IP_ADDR_VALUE}" -i ~/.ssh/secret -t sudo systemctl restart taskbot.service
```

## Lab 5
```
#!/usr/bin/env bash
echo "Usage openstack credentials"
source $HOME/openstack.sh
IP_ADDR_VALUE=$(openstack server show timofeev-instance -c addresses -f value | grep -oP "'\K[0-9.]+(?=')")
JAR_PATH="${WORKSPACE}/target/taskbot-1.0-SNAPSHOT-jar-with-dependencies.jar"
echo $IP_ADDR_VALUE
scp -i ~/.ssh/secret "${JAR_PATH}" "ubuntu@${IP_ADDR_VALUE}":/home/ubuntu/taskbot.jar
ssh "ubuntu@${IP_ADDR_VALUE}" -i ~/.ssh/secret -t sudo systemctl restart taskbot.service
```

To run:
`touch secrets.auto.tfvars`
File contents:
```
username     = "name"
userpassword = "qwerty"
```

`terraform apply`


### Ansible

Prepare:
```
chmod 600 ~/.ssh/timofeevssh
```

```
ansible-galaxy collection install community.postgresql
sudo apt install ansible
ansible-playbook lab3.yaml
```

