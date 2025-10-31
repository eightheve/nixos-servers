{
  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.1/24" ];
    listenPort = 51820;
    privateKeyFile = "/etc/wireguard/privatekey";
    peers = [
      {
        publicKey = "DyANBVsJJpuljhXzxl7zAjIH9Je0Zv9wXUTTmwFtcG8=";
        allowedIPs = [ "10.100.0.2/32" ];
        persistentKeepalive = 25;
      }
    ];
  };

  networking.enableIPv6 = true;
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
  };

  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
  };

  networking.firewall.extraCommands = ''
    # Forward all inbound TCP and UDP traffic except port 2222
    iptables -t nat -A PREROUTING -i eth0 -p tcp ! --dport 2222 -j DNAT --to-destination 10.100.0.2
    iptables -t nat -A PREROUTING -i eth0 -p udp ! --dport 2222 -j DNAT --to-destination 10.100.0.2
  '';
}
