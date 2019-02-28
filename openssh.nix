{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  users.users.root.openssh.authorizedKeys.keys = [ 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEinGNp/dMkIT9cOuLepE4VJp5WLI+tvoRzpzStL2hkd user@odin"
  ];
}
