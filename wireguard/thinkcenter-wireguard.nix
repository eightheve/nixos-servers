{
  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.2/24" ];
    privateKeyFile = "/etc/wireguard/privatekey";
    peers = [
      {
        publicKey = "1I3PO1MgFdqffo816H34YalYgnCrwPo3ssBbsLTxzBg=";
        allowedIPs = [ "0.0.0.0/0", "::/0" ];
        endpoint = "5.161.238.34:51820";
        persistentKeepalive = 25;
      }
    ];
  };
}
