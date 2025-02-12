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
      "jetbrains-toolbox"
      "webstorm"
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
      "google-chrome"
      "sidequest"
      "kitty@nightly"
      "zen-browser@twilight"
      "youtube-music"
      "orbstack"
      "legcord"
    ];
    brews = [
      "libiconv"
      "switchaudio-osx"
      "nowplaying-cli"
      {
        name = "ollama";
        start_service = true;
      }
    ];
  };
}
