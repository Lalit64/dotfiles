{
  description = "snowflake config for my systems";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # home-manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-darwin
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    # nixvim
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nvf
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # vscode-extensions
    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };
  outputs =
    {
      self,
      nixpkgs,
      darwin,
      home-manager,
      stylix,
      # nixvim,
      nvf,
      vscode-extensions,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      # Define user configurations
      users = {
        lalit = {
          email = "lalit.yalamanchili@gmail.com";
          fullName = "Lalit Yalamanchili";
          name = "lalit";
        };
      };

      # Function for nix-darwin system configuration
      mkDarwinConfiguration =
        system: hostname: username: wallpaper:
        darwin.lib.darwinSystem {
          system = system;
          pkgs = import nixpkgs {
            system = system;
            config.allowUnfree = true;
            overlays = [
              (final: prev: {
                sbar-lua = prev.callPackage ./pkgs/sbarlua.nix { };
              })
	            vscode-extensions.overlays.default
            ];
          };
          specialArgs = {
            inherit
              inputs
              outputs
              hostname
              wallpaper
              ;
            userConfig = users.${username};
          };
          modules = [
            ./hosts/${hostname}/default.nix
            home-manager.darwinModules.home-manager
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
                    wallpaper
                    ;
                };
                users."${username}" = {
                  imports = [
                    ./home/${username}/${hostname}.nix
                    # nixvim.homeManagerModules.nixvim
                    nvf.homeManagerModules.default
                    stylix.homeManagerModules.stylix
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
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/nix-catppuccin-mocha.png";
        "home-desk" =
          mkDarwinConfiguration "aarch64-darwin" "home-desk" "lalit"
            "/Users/lalit/.config/snowflake/home/lalit/modules/wallpapers/nix-catppuccin-mocha.png";
      };
    };
}
