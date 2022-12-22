# Ansible-roles-terraforrm
Code to deploy several vms + Ansible to configure

### Hi there! ###
In this repo u can find some Terraform code to use locally and Ansible role-structured playbook.

### How it works ? ###

Terraform:
  - Terraform with _dmacvicar/libvirt_ provider
  > Note! u need to have libvirt (Qemu KVM VirtManager)
  - Ubuntu Iso image downloaded locally
  - Minio: S3-based storage for terraform backend
  
Terraform is being used to deploy several vms via _for_each_ constructure.

Terraform generates Ansible _hosts.ini_ file for being used in future playbooks executions.

Ansible:
  - Uses dir hierarchy with rules + playbook
  - Uses reusable rules
  
As i said preiously, Terraform generates inventory for ansible.

For this purpose the _ansible-hosts.tpl_ file was created.

### How to use ###
Files need to be created additinaly:
  - cloud_init.cfg
  - terraform.tfvars (with your own variables values)
  > Note! U can use input variables list from _variables.terraform_ file
  - recommend u to change ansible config file for disabling host_key_checking
  
>About TF backend: if u feel unconfident using TF backend u can skip backend block and use terraform with tfstate locally

### How to use ###

```
terraform init
```
```
terraform plan
```
```
terraform apply
```
```
cd ansible
```
```
ansible-playbook -i inventory/hosts.ini -u <remote user>  really-main.yml
```


### Useful links: ###
[About Ansible](https://docs.ansible.com/ansible_community.html)

[About Terraform](https://developer.hashicorp.com/terraform/docs)

[Libvirt privider](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)

[About Libvirt](https://ubuntu.com/server/docs/virtualization-libvirt)

[About writing cloud_init_config](https://cloudinit.readthedocs.io/en/latest/topics/examples.html)

[Images to use for deploys](https://cloud-images.ubuntu.com/)

[About Minio storage](https://min.io/docs/minio/container/index.html) 





  
  
