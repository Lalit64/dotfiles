{ ... }:
{
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation.cleanup = "zap";
    global = {
      brewfile = true;
      # lockfiles = true;
    };
    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
    ];
    casks = [
      "android-platform-tools"
      "android-studio"
      "background-music"
      "karabiner-elements"
      "modrinth"
      "protonvpn"
      "whatsapp"
      "ubersicht"
      "zen-browser"
      "mythic"
      "handbrake"
      "ghostty"
    ];
    brews = [
      # {
      #   name = "sketchybar";
      #   start_service = true;
      #   restart_service = "changed";
      # }
    ];
  };
}
