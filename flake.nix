{
  description = "Configuration for homelab and linked VPS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      thinkcenter = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/thinkcenter.nix
          ./hardware/thinkcenter-hardware.nix
          ./wireguard/thinkcenter-wireguard.nix
        ];
      };

      hetzner = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/vps.nix
          ./hardware/vps-hardware.nix
          ./wireguard/vps-wireguard.nix
        ];
      };
    };
  };
}
