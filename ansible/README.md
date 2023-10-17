Создание шаблона в vmware:
https://github.com/VlzKirill/ubuntu20_vmware_packer

Базовая настройка ВМ:
https://github.com/VlzKirill/create_vm_and_base_config_vmware_ansible

Запуск playbook:
sudo ansible-playbook playbooks/config_vm.yaml --extra-vars='ansible_user=$ANSIBLE_USER ansible_password=$ANSIBLE_PASS ansible_sudo_pass=$ANSIBLE_PASS'