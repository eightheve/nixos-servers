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
  
  networking = {
    hostName = "KAZOOIE";
    firewall = {
      allowedTCPPorts = [ 22 2222 ];
      allowedUDPPorts = [ 51820 ];
    };
  };
  
  system.stateVersion = "25.11";
}
