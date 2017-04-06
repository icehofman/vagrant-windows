# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "Win7IE9-winrm"
	config.vm.box_url = "https://tnyila.dm2304.livefilestore.com/y4mGrNzBW0Y6xzrkBOeP_svqUj8QN3p4FnTUY2W82sA3uu7-dYgARS5siOpP2Ov2WSDyG8d1UKYozN5aHp3zq5gQ9IyHEbe_rbGngpWSWS22SiF31ey7ZFMGyO7KR4piT-ABl56tKRuzzxYs_bOQdn_xyaN7iOrzXItXsGwSNUCUQMvQmkyFi8SAkZvay312Xp4/package.box?download&psid=1"

	config.vm.guest = :windows
	config.vm.communicator = "winrm"
    config.vm.boot_timeout = 500
	config.windows.halt_timeout = 20
    config.windows.set_work_network = true
    config.winrm.username = "IEUser"
    config.winrm.password = "Passw0rd!"

    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
    config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

    config.vm.synced_folder ".", "/vagrant"
	
	config.vm.provider "virtualbox" do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 1]
        v.customize ["modifyvm", :id, "--vram", 128]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
        v.customize ["modifyvm", :id, "--accelerate3d", "on"]
        v.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]        
        v.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]    
  end
end
