{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];


  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "xfs";
  };

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking = {
    dhcpcd.enable = false;
    useNetworkd = true;
  };

  systemd.network.networks."10-ens3" = { 
    matchConfig = { Name = "ens3"; };  
    routes = [
      { routeConfig.Gateway = "fe80::1"; }
      { routeConfig = { 
          Gateway = "172.31.1.1";
          GatewayOnlink = true;
        };  
      }
    ];
  };


}

