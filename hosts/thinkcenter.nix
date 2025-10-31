{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "BANJO";

    networkmanager.enable = true;
    interfaces.enp1s0f0.ipv4.addresses = [
      {
        address = "192.168.1.2";
        prefixLength = 24;
      }
    ];
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users = {
    sana = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLd2Cxrph6ES6ClDbqXFDWhI9+N+2+sKI5DMlFOco0XMmX8kHUNEOZengOpzJQ60EcNYYZbBd6mapqAd3Z/bGQg= sana"
        "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGXE85j6/DEbt7UZS2nRfjNzdPClPwBG/admRewhTYUnr2JeXr+lLOS9tWk/vsgzkwFaxvlUvvRvTWWJwoeZd7DnwE2oy+1GXwFPqUHjDQg/DpQR8eu7U28Do6+moNTqLGW13FrMyv4CraXTcSn40E5PZvuOWyNjhsGSsFHeyt/J9Fgjg== sana"
      ];
    };
    nxsu = {
      isNormalUser = true;
      #extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
    sarah = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1j4tSWkFSt77q6cL8DbQ+VFlwXM/BWUsJXHpCIiP18qSNiCXuST+67OAZCvKgpwF87E2KwmKdDzrevkPy7oviVKefiKsW3zb5uY6LdPXvuH4fguztAISfDFLKvgTe437tUROPwy0JEtgiqSYkueMHjerDnpAFfYfBsrzRQ8vNS3K70vBPfSuwPsgOcTLZ6K6npC+xvjBoT6KzLV4wPuQTsc65IRYoqjW1kp7JT/v1rMcgpzxuYmy9ZvdQ2cnoAuQcbEABjtzRLAn46iB3mwTtHYNQmQnYQwzeymuipxhCeVjaPMekm2EX+RKR2fpZt1/fXo/hPYZrlVVCHexy4GnC9zkAgqUz99EYChSe4mY8eZzk7yAf6y0N4d7Fh1xcM7S96AbeGeosgxW/tV7Qr7W9gsg1ZgFxyw7tZ9ZhJWAGEt0TTlSyNcruSPgfysINjPqx2CVY/cED+U8Z0Q6ix6cFYW9Yq/A7tIrnOBuiVWklwRPC+n9bM8ZMUnRmzlvcpolWIUA7bjzoBWKNDeUEo93gfOpQC+bN0qSnfWR01O0ez3hT6DjVssjk2M9AK1ah2VJSFXHz97SHu0VRlAKqu1MjjZOXZX+DKH9FFcMeK1du59H+UsppE9+Z2wuL2mNSQpNj0ipYnQpiTekv6Lycly8/P+K5jLrFd2KRJyf7apyoIw== sarah"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    home-manager
  ];

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?
}
