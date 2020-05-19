# UPenn2
Projects
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)
\Users\User\Desktop\UPeen2\Above\Diagrams\daythree.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the __playbook___ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
---
- name: Config elk with docker
  hosts: elkservers
  remote_user: elk
  become: true
  tasks:

  - name: install docker.io
    apt:
      force_apt_get: yes
      name: docker.io
      state: present

  - name: install pip
    apt:
      force_apt_get: yes
      name: python-pip
      state: present

  - name: install Docker python module
    pip:
      name: docker
      state: present

  - name: Increase virtual memory
    command: sysctl -w vm.max_map_count=262144

  - name: download and launch a docker elk container
    docker_container:
      name: elk
      image: sebp/elk
      state: started
      published_ports:
        - 5601:5601
        - 9200:9200
        - 5044:5044

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly __available___, in addition to restricting __taffic___ to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Load Balancers have the ability for deflecting DDOS attacks by shifting attack traffic from the corporate server to a public cloud provider.
The advantage of usin a jump is that it is ususaly hardedned and configured securly, allowing one to controle traffic to a network or sshing into a server.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the ___VM__ and system ___process__.
- _TODO: What does Filebeat watch for?_
- _TODO: What does Metricbeat record?_

Filebeat allows users to collect specific log data one is interested in.
Metricbeat records machiine metrics, such as uptime



The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| elk server| server  | 10.0.0.6   | Linux            |
| DVW1     | webserver| 10.0.0.5   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ___jump__ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_
173.49.205.16

Machines within the network can only be accessed by ___Jump box__.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_


the only machine that has accsess to my elk Vm is the jump box. its private ip address is 10.0.0.5 


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

when you automate configuration with ansible you save time ,eliminate repetitive tasks and there are fewer mistakes & errors.


The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._

-install docker.io 
- install python - pip
-download the docker container image
-configure the container to start with specific ports


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
10.0.0.4
We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
i have installed metric beats and file beats in th elek sever.

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
metric beats collects system level monitring, like meory, network, etc.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the __playbook___ file to ___hosts__.
- Update the ___hosts __ file to include...
- Run the playbook, and navigate to __web server__ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

-
-i updated the hosts file.
- i went to http://52.170.114.142:5601/app/kibana#/home/tutorial_directory/sampleData


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
ansible-playbook /etc/ansible/nameoffile.yml
