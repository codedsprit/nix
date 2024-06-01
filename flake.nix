{
  description = "PwnWriter's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager,  hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      UserName = "pwn";
      HostName = "writer";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = { inherit inputs UserName HostName; };
        modules = [
          ./core
          home-manager.nixosModules.home-manager
          (config: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${UserName} = config.users.${UserName} or import ./home;
          })
        ];
      };
    };
}
