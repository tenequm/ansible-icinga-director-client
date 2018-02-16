# Ansible Role: Icinga Director Client

This role applies Icinga2 client installation and it's registration with Icinga Director, so that host will be immediately added to your Icinga2 monitoring system. Currently works only for Ubuntu and Debian distros.

## Requirements

This role requires Ansible 2.4 or higher. Requirements are listed in the metadata file.

## Role Variables

| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| `icinga_client_fqdn` | No | `{{ ansible_fqdn }}` | Icinga client FQDN. |
| `icinga_client_ip` | No | `{{ ansible_default_ipv4.address }}` | Icinga client IP used to communicate with master. |
| `icinga_client_display_name` | No | `{{ inventory_hostname }}` | Icinga client display name. |
| `icinga_client_certs_path` | No | `/var/lib/icinga2/certs/` | Path to Icinga client certs directory. |
| `icinga_client_import_template` | Yes | Not set | Host template name registered in Icinga Director. |
| `icinga_master_fqdn` | Yes | Not set | Icinga master FQDN. |
| `icinga_master_ip` | Yes | Not set | Icinga master IP. |
| `icinga_master_port` | No | `5665` | Icinga master port. |
| `icinga_director_user` | Yes | `admin` | Icinga Web user for API authentication.  |
| `icinga_director_pass` | Yes | Not set | Icinga Web user password for API authentication.  |
| `icinga_director_host_protocol` | No | `http` | Protocol used to communicate with Icinga Director - http or https.  |


Example Playbook
----------------
```
- hosts: localhost
  become: yes
  roles:
    - tenequm.icinga-director-client
  vars:
    icinga_director_pass: admin
    icinga_client_import_template: 'Linux Server'
    icinga_master_fqdn: icinga.example.com
    icinga_master_ip: 127.0.0.1
```
License
-------
MIT

Author Information
------------------
This role was created in 2018 by [Mykhaylo Kolesnik](http://github.com/tenequm).
