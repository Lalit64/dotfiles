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
          "/Applications/Zen Twilight.app/"
          "${pkgs.vscodium}/Applications/VSCodium.app/"
          "/Applications/kitty.app/"
          "${pkgs.logseq}/Applications/Logseq.app/"
          "/Applications/sioyek.app/"
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
