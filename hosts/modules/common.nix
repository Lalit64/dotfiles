{
  pkgs,
  userConfig,
  hostname,
  ...
}:
{

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  nix.optimise.automatic = true;

  programs.zsh.enable = true;
  users.users.${userConfig.name}.home = "/Users/${userConfig.name}";

  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    systemPackages = [
      pkgs.coreutils
    ];
    systemPath = [ "/usr/local/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  local = {
    dock = {
      enable = true;
      entries = [
        { path = "/Applications/Zen Browser.app/"; }
        { path = "/Applications/iPhone Mirroring.app/"; }
        { path = "${pkgs.zed-editor}/Applications/Zed.app/"; }
        { path = "${pkgs.kitty}/Applications/kitty.app/"; }
        { path = "${pkgs.zoom-us}/Applications/zoom.us.app/"; }
      ];
    };
    wallpaper = {
      enable = true;
    };
  };

  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {
      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";
        # Show all file extensions
        AppleShowAllExtensions = true;
        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
      };
      screencapture = {
        location = "/Users/${userConfig.name}/Desktop/screenshots";
        type = "png";
        disable-shadow = true;
      };
      dock = {
        # Automatically hide and show the Dock
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.45;

        # Style options
        orientation = "left";
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  networking.hostName = hostname;

  services.nix-daemon.enable = true;

  # touch id sudo
  security.pam.enableSudoTouchIdAuth = true;

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };

  imports = [
    ./brew.nix
    ./borders.nix
    ./activation.nix
  ];

  # backwards compat; don't change
  system.stateVersion = 4;
}
