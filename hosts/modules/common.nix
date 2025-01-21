{
  pkgs,
  username,
  hostname,
  wallpaper,
  ...
}:
{

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnsupportedSystem = true;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  nix.optimise.automatic = true;

  programs.zsh.enable = true;
  users.users.${username}.home = "/Users/${username}";

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

  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    activationScripts.postUserActivation.text = ''
       # Wallpaper
       echo >&2 "Setting the wallpaper..."
      osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${wallpaper}"'
    '';

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
        location = "/Users/${username}/Desktop/screenshots";
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

        persistent-apps = [
          "/Applications/Zen Browser.app/"
          "${pkgs.vscodium}/Applications/VSCodium.app/"
          "${pkgs.zed-editor}/Applications/Zed.app/"
          "/Applications/kitty.app/"
          "${pkgs.zoom-us}/Applications/zoom.us.app/"
        ];
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
    ./aerospace.nix
  ];

  # backwards compat; don't change
  system.stateVersion = 4;
}
