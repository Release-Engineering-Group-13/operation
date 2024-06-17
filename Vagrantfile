workers = 2
ip_base = "192.168.56."

Vagrant.configure("2") do |config|

  config.vm.provision "shell", inline: "echo Hello"
  config.vm.box = "bento/ubuntu-24.04"

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p /home/vagrant/.ssh
    cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    rm -f /tmp/id_rsa.pub
    chmod 700 /home/vagrant/.ssh
    chmod 600 /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh
  SHELL

  # CONTROLLER
  # ------------
  config.vm.define "controller" do |controller|
    controller.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # 4GB
      vb.cpus = "1"
    end

    controller.vm.hostname = "controller"
    controller.vm.network "private_network", ip: ip_base+"10"

    # controller.vm.provision :ansible do |a|
    #   a.compatibility_mode = "2.0"
    #   a.playbook = "playbookController.yml"
    # end

  end


  # WORKERS
  # ------------
  (1..workers).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024" # 6GB
        vb.cpus = "1"
      end
      
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: ip_base+"#{10+i}"

      # node.vm.provision :ansible do |a|
      #   a.compatibility_mode = "2.0"
      #   a.playbook = "playbookWorker.yml"
      # end
      
    end

  end
end
