{ ... }:
{
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation.cleanup = "zap";
    global = {
      brewfile = true;
      autoUpdate = true;
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
      "handbrake"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "google-chrome"
      "sidequest"
      "kitty"
      "ghostty@tip"
      "zen-browser@twilight"
      "youtube-music"
      "obsidian"
      "orbstack"
      "libreoffice"
      "lm-studio"
      "heroic"
      "motrix"
    ];
    brews = [
      "libiconv"
      "switchaudio-osx"
      "nowplaying-cli"
      "fonttools"
      {
        name = "ollama";
        start_service = true;
      }
    ];
  };
}
