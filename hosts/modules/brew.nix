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
      "th-ch/youtube-music"
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
      "mythic"
      "handbrake"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "orbstack"
      "google-chrome"
      "sidequest"
      "kitty@nightly"
      "sioyek"
      "zen-browser@twilight"
      "youtube-music"
      "lm-studio"
    ];
    brews = [
      "libiconv"
      "switchaudio-osx"
      "nowplaying-cli"
    ];
  };
}
