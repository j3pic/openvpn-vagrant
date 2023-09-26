# TODO: Write.
# Use documentation:
#
# https://www.vagrantup.com/docs/multi-machine

host_map = File.open('hosts') do |f|
  f.readlines.map(&:strip).select do |line|
    line.shellsplit[0][0] != '#'
  end.map do |line|
    ip, hostname = line.shellsplit
    [hostname, ip] # Drop other tokens
  end.to_h
end

def include_in_production_deployment(config)
  if config.respond_to?(:include_in_production_deployment)
    config.include_in_production_deployment
  end
end

Vagrant.configure("2") do |config|
  # config.vm.provision "shell", inline: "echo Hello"
  config.vm.define "openvpn" do |ovpn|
    include_in_production_deployment(ovpn)
    ovpn.vm.box = "ubuntu/focal64"
    ovpn.vm.synced_folder "#{ENV['HOME']}", "/host-home"
    ovpn.vm.provision :shell, path: "openvpn/provision.sh"
    ovpn.vm.network "private_network", ip: host_map['openvpn']
    ovpn.vm.provider "virtualbox" do |v|
      v.memory=2048
    end
  end
end
