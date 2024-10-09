Vagrant.configure("2") do |config|


  config.vm.provision "shell", path: "scripts.sh"


  config.vm.define "controle" do |controle|
    controle.vm.box = "shekeriev/debian-11"
    controle.vm.hostname = "controle"
    controle.vm.network "private_network", ip: "172.17.177.100"
    controle.vm.provider "virtualbox" do |vb|
      vb.name = "controle"
      vb.memory = "2048"
      vb.cpus = 2
    end
    controle.vm.provision "shell", inline: "apt -y install git"
  end

  config.vm.define "web" do |web|
    web.vm.box = "shekeriev/debian-11"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "172.17.177.101"
    web.vm.provider "virtualbox" do |vb|
      vb.name = "web"
      vb.memory = "512"
      vb.cpus = 2
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "shekeriev/debian-11"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "172.17.177.102"
    db.vm.provider "virtualbox" do |vb|
      vb.name = "vb"
      vb.memory = "512"
      vb.cpus = 2
    end
  end

end
