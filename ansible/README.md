// On workstation install ansible tool

sudo apt install ansible

// navigate to terraform_helm_chart_poc\ansible

sudo apt install sshpass

ansible-playbook -i hosts-ubuntu.ini site.yaml -e kubernetes_init_host=master-node -v