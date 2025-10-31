{ pkgs, ... }:

{
  users.users = {
    root.hashedPassword = "!"; # Disable root login
    sana = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLd2Cxrph6ES6ClDbqXFDWhI9+N+2+sKI5DMlFOco0XMmX8kHUNEOZengOpzJQ60EcNYYZbBd6mapqAd3Z/bGQg= sana@doppel.moe"
        "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGXE85j6/DEbt7UZS2nRfjNzdPClPwBG/admRewhTYUnr2JeXr+lLOS9tWk/vsgzkwFaxvlUvvRvTWWJwoeZd7DnwE2oy+1GXwFPqUHjDQg/DpQR8eu7U28Do6+moNTqLGW13FrMyv4CraXTcSn40E5PZvuOWyNjhsGSsFHeyt/J9Fgjg== sana"
      ];
    };
  };
  security.sudo.wheelNeedsPassword = false;
  
  services.openssh = {
    enable = true;
    ports = [ 22 2222 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
