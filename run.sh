ansible-playbook -i inventory.cfg playbooks/install.yml
ansible-playbook -i inventory.cfg playbooks/install.yml
ansible-playbook -i inventory.cfg playbooks/playbookController.yml
ansible-playbook -i inventory.cfg playbooks/playbookWorkers.yml
mkdir -p ~/.kube
ssh vagrant@192.168.56.10 "sudo cat /root/.kube/config" > ~/.kube/config
