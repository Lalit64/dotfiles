{
  description = "snowflake config for my systems";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    darwin.url = "git+ssh://git@github.com/lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "git+ssh://git@github.com/nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    lix.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
    lix.inputs.nixpkgs.follows = "nixpkgs";

    nh.url = "git+ssh://git@github.com/viperML/nh";
    nh.inputs.nixpkgs.follows = "nixpkgs";

    # system theming
    stylix.url = "git+ssh://git@github.com/danth/stylix";
    catppuccin.url = "github:catppuccin/nix";

    # my nix user repository
    lalit64-nur.url = "git+ssh://git@github.com/lalit64/nur.git";
    lalit64-nur.inputs.nixpkgs.follows = "nixpkgs";

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # vscode-marketplace for vscodium extensions
    nix-vscode-extensions.url = "git+ssh://git@github.com/nix-community/nix-vscode-extensions";

    # sbarlua
    sbarlua.url = "github:lalit64/SbarLua/nix-darwin-package";
    sbarlua.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      # Function for nix-darwin system configuration
      mkDarwinConfiguration =
        system: hostname: username: wallpaper:
        inputs.darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              outputs
              hostname
              username
              system
              wallpaper
              ;
          };
          modules = [
            ./hosts/${hostname}/default.nix
            inputs.lix.nixosModules.default
            inputs.home-manager.darwinModules.home-manager
            {
              users.users."${username}".home = "/Users/${username}";
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit
                    inputs
                    outputs
                    hostname
                    username
                    system
                    wallpaper
                    ;
                };
                users."${username}" = {
                  imports = [
                    ./home/${username}/${hostname}.nix
                    inputs.nvchad4nix.homeManagerModule
                    inputs.stylix.homeManagerModules.stylix
                    inputs.catppuccin.homeManagerModules.catppuccin
                  ];
                };
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = {
        "lalits-mbp" =
          mkDarwinConfiguration "aarch64-darwin" "lalits-mbp" "lalit"
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/catppuccin-galaxy.png";
        "home-desk" =
          mkDarwinConfiguration "aarch64-darwin" "home-desk" "lalit"
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/catppuccin-galaxy.png";
      };
    };
}
