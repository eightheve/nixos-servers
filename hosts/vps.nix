{ pkgs, ... }:

{
  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  environment.systemPackages = with pkgs; [
    nano
    git
    wget
  ];
  
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  
  networking.firewall.allowedTCPPorts = [ 22 ];
  
  system.stateVersion = "25.11";
}
