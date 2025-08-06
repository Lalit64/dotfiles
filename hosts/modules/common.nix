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
    config.allowUnfreePredicate = (_: true);
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  nix.optimise.automatic = true;

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    systemPackages = [
      pkgs.coreutils
    ];
    systemPath = [
      "/usr/local/bin"
      "/opt/homebrew/bin"
      "/Users/${username}/.local/bin"
      "/Users/${username}/.cargo/bin"
      "/Users/${username}/Library/pnpm"
      "/Users/${username}/.bun/bin"
      "/Users/${username}/.lmstudio/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };

  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    startup.chime = true;

    activationScripts.postUserActivation.text = ''
      # Wallpaper
      echo >&2 "Setting the wallpaper..."
      osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${wallpaper}"'

      # disable .DS_Store files
      defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
      defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE

      # hide icons on desktop
      defaults write com.apple.finder CreateDesktop FALSE; killall Finder
    '';

    defaults = {
      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";
        # Show all file extensions
        AppleShowAllExtensions = true;
        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
        # Disable window animations
        NSAutomaticWindowAnimationsEnabled = false;
      };

      screencapture = {
        location = "/Users/${username}/Desktop/screenshots";
        type = "png";
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
          "/Applications/Twilight.app/"
          "${pkgs.zed-editor}/Applications/Zed.app/"
          "/Applications/Ghostty.app/"
          "/Applications/Obsidian.app/"
          "${pkgs.sioyek}/Applications/sioyek.app/"
        ];
      };
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  networking.hostName = hostname;

  # touch id sudo
  security.pam.services.sudo_local.touchIdAuth = true;

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
  system.stateVersion = 5;
}
