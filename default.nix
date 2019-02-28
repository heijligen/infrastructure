{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Berlin";

  i18n = {
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    vim git
  ];
}
