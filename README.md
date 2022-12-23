# Ansible-roles-terraforrm
Code to deploy several vms + Ansible to configure

### Hi there! ###
In this repo u can find some Terraform code to use locally and Ansible role-structured playbook.

### How it works ? ###

Terraform:
  - Terraform with _dmacvicar/libvirt_ provider_
  > Note! u need to have libvirt (Qemu KVM VirtManager)
  - Ubuntu Iso image downloaded locally
  - Minio: S3-based storage for terraform backend
  
Terraform is being used to deploy several vms via _for_each_ constructure.

Terraform generates Ansible _hosts.ini_ file for being used in future playbooks executions.

Ansible:
  - Uses dir hierarchy with rules + playbook
  ```
primary.yml--->(for creating iaac file in /etc dir + getting info about hosts Ansible is working with)
inventory/
└── hosts.ini-->(generated by Terraform)
roles/
├── file-cerator/
|     ├── tasks/
|     |     └── main.yml
|     ├── defaults
|     │     └── main.yml
|     └── vars
|           └── main.yml
└── informer/
        │── tasks/
        │     └── main.yml
        ├── defaults
        │     └── main.yml
        └── vars
              └── main.yml
 ```
  - Uses reusable rules
  
As i said preiously, Terraform generates inventory for ansible.

For this purpose the _ansible-hosts.tpl_ file was created.

### How to use ###
Files need to be created additinaly:
  - _cloud_init.cfg_ (i'm using cloud_init to push public key to VMs, you can check how to configure it [here](https://cloudinit.readthedocs.io/en/latest/topics/examples.html))
  - _terraform.tfvars_ (with your own variables values)
  - right template(u can see an example in this repo) for performing _hosts.ini_ generation
  > Note! U can use input variables list from _variables.terraform_ file
  
>About TF backend: if u feel unconfident using TF backend u can skip backend block and use terraform with tfstate locally

### How to use ###
To download Terraform provider modules:
```
terraform init
```
To plan infrastructure creation:
```
terraform plan
```
To apply changes:
```
terraform apply
```
Then cd to ansible dir to work with Ansible with following command:
```
cd ansible
```
Execute the playbook (by name):
  - primary.yml_
by running following command
```
ansible-playbook -i inventory/hosts.ini <playbook-name>
```

>You can skip adding _-u $username_ step if username is defined in role's variable (see .../roles/$role-name/vars/main.yml content)

>Host checking is disabled by role's defaults (see .../roles/$role-name/defaults/main.yml content)


### Useful links: ###
[About Ansible](https://docs.ansible.com/ansible_community.html)

[About Terraform](https://developer.hashicorp.com/terraform/docs)

[Libvirt privider](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)

[About Libvirt](https://ubuntu.com/server/docs/virtualization-libvirt)

[About writing cloud_init_config](https://cloudinit.readthedocs.io/en/latest/topics/examples.html)

[Images to use for deploys](https://cloud-images.ubuntu.com/)

[About Minio storage](https://min.io/docs/minio/container/index.html) 





  
  
