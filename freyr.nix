{ config, pkgs, ... }:

{

  system.stateVersion = "18.09";

  imports = [
      ./default.nix
      ./hetzner.nix
      ./openssh.nix
    ];

  networking.hostName = "freyr";

  systemd.network.networks."10-ens3".address = [
    "2a01:4f8:1c1c:650f::1/64"
    "195.201.140.62/32"
  ];






} # end config

