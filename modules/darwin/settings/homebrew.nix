# Not using anymore
{ pkgs, ... }: {
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      brewfile = true;
      # lockfiles = true;
    };
    casks = [
      "android-platform-tools"
      "android-studio"
      "background-music"
      "hammerspoon"
      "karabiner-elements"
      "modrinth"
      "protonvpn"
      "whatsapp"
      "ubersicht"
      "zen-browser"
    ];
    # brews = [];
  };
}
