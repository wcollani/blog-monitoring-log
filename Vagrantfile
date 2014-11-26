# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

hosts = {
"nginx-test" => "192.168.33.40",
"redis-node0" => "192.168.33.50",
"rmq-node0" => "192.168.33.60",
"sensu-node0" => "192.168.33.70",
"logstash-node0" => "192.168.33.80",
"es-node0" => "192.168.33.90",
"dashboard-node0" => "192.168.33.110"
}

Vagrant.configure("2") do |config|
  hosts.each do |name, ip|
    config.vm.define name do |machine|
        machine.vm.box = "ubuntu/trusty64"
        machine.vm.hostname = "%s" % name
        machine.vm.network :private_network, ip: ip
        machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.memory = 512
	  v.cpus = 1
        end
     end
   end
end
