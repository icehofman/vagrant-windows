# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "Win7IE9"
	config.vm.box_url = "http://aka.ms/vagrant-win7-ie9"

	config.vm.guest = :windows
	config.vm.communicator = "winrm"
    config.vm.boot_timeout = 500
	config.windows.halt_timeout = 20
    config.winrm.username = "IEUser"
    config.winrm.password = "Passw0rd!"

    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
    config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

    config.vm.synced_folder ".", "/vagrant"
	
	config.vm.provider "virtualbox" do |v|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 1]
        v.customize ["modifyvm", :id, "--vram", 128]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["modifyvm", :id, "--accelerate3d", "on"]
        v.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]        
        v.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]    
  end

  config.vm.provision "shell", path: "fixnetwork.ps1"
  config.vm.provision "shell", path: "enable-rdp.bat"
  config.vm.provision "shell", path: "enable-winrm.bat"

end
