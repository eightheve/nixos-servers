{ pkgs, ... }:

{
  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  environment.systemPackages = with pkgs; [
    nano
    git
  ];
  
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  
  users.users = {
    root.hashedPassword = "!"; # Disable root login
    sana = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLd2Cxrph6ES6ClDbqXFDWhI9+N+2+sKI5DMlFOco0XMmX8kHUNEOZengOpzJQ60EcNYYZbBd6mapqAd3Z/bGQg= sana@doppel.moe
      ];
    };
  };
  
  security.sudo.wheelNeedsPassword = false;
  
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  
  networking.firewall.allowedTCPPorts = [ 22 ];
  
  system.stateVersion = "25.05";
}
