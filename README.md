Sensu & ELK stack demo
===================

To setup the demo
1. Clone the github project
2. Run ‘vagrant up’ to start the required VMs
3. Run ‘ansible-playbook -i hosts deploy-monitoring-cluster-vagrant.yml’ to configure

It will take a few minutes for information to start populating the system but once setup and configured the dashboards are
1. Kibana, http://192.168.33.110/kibana/
2. Sensu, http://192.168.33.70:3000
