{
  description = "snowflake config for my systems";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # lix.systems
    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nh cli
    nh.url = "github:viperML/nh";
    nh.inputs.nixpkgs.follows = "nixpkgs";

    # system theming
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";

    # my nix user repository
    lalit64-nur.url = "github:lalit64/nur";
    lalit64-nur.inputs.nixpkgs.follows = "nixpkgs";

    # nvf - neovim configuration
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # vscode-marketplace for vscodium extensions
    vscode-marketplace.url = "github:nix-community/nix-vscode-extensions";

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
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              (final: prev: {
                lalit64-nur = inputs.lalit64-nur.packages."${prev.system}";
                sbarlua = inputs.sbarlua.packages."${prev.system}".sbarlua;
                nh = inputs.nh.packages."${prev.system}".nh;
              })
              inputs.lix.overlays.lixFromNixpkgs
              inputs.vscode-marketplace.overlays.default
            ];
          };
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
                    inputs.nvf.homeManagerModules.default
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
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/catppuccin-flora.png";
        "home-desk" =
          mkDarwinConfiguration "aarch64-darwin" "home-desk" "lalit"
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/catppuccin-flora.png";
      };
    };
}
