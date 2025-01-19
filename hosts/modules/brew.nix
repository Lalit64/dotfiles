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
      "zen-browser"
      "mythic"
      "handbrake"
      "ghostty"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "orbstack"
      "google-chrome"
      "sidequest"
      "kitty@nightly"
    ];
    brews = [ ];
  };
}
