workers = 2
ip_base = "192.168.56."

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.provision "shell", inline: <<-SHELL
    chmod 600 /home/vagrant/.vagrant/machines/controller/virtualbox/private_key
  SHELL

  # Copy SSH public key to the VM
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p ~/.ssh
    cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    rm /tmp/id_rsa.pub
  SHELL

  # CONTROLLER
  # ------------
  config.vm.define "controller" do |controller|
    controller.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # 4GB
      vb.cpus = "1"
    end

    controller.vm.hostname = "controller"
    controller.vm.network "private_network", type: "dhcp", ip: ip_base+"10"

    controller.vm.provision :ansible do |a|
      a.compatibility_mode = "2.0"
      a.playbook = "playbook.yml"
      a.extra_vars = { node_type: 'controller', ip: ip_base+"10" }
    end

  end


  # WORKERS
  # ------------
  (1..workers).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024" # 6GB
        vb.cpus = "1" # 2 CPUS
      end
      
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", type: "dhcp", ip: ip_base+"#{10+i}"

      node.vm.provision :ansible do |a|
        a.compatibility_mode = "2.0"
        a.playbook = "playbook.yml"
        a.extra_vars = { node_type: 'worker', ip: ip_base+"#{10+i}" }
      end
      
    end

  end
end
