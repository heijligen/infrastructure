{ config, pkgs, ... }:

{

  system.stateVersion = "18.09";

  imports = [
      ./default.nix
      ./hetzner.nix
      ./openssh.nix
    ];

  networking.hostName = "njord";

  systemd.network.networks."10-ens3".address = [
    "2a01:4f8:1c1c:b027::1/64"
    "116.203.78.164/32"
  ];






} # end config

