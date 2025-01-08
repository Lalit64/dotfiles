{ ... }:
{
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation.cleanup = "zap";
    global = {
      brewfile = true;
    };
    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "encoredev/tap"
    ];
    casks = [
      "android-platform-tools"
      "android-studio"
      "background-music"
      "karabiner-elements"
      "modrinth"
      "httpie"
      "protonvpn"
      "whatsapp"
      "ubersicht"
      "zen-browser"
      "mythic"
      "handbrake"
      "ghostty"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "orbstack"
      "eloston-chromium"
    ];
    brews = [
      "switchaudio-osx"
      "nowplaying-cli"
      "readline"
      "encore"
    ];
  };
}
