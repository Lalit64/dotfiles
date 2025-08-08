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
      "yaak"
      "zoom"
      "protonvpn"
      "whatsapp"
      "handbrake-app"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "google-chrome"
      "sidequest"
      "kitty"
      "ghostty@tip"
      "zen@twilight"
      "gitbutler"
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
      "fzf"
      {
        name = "ollama";
        start_service = true;
      }
    ];
  };
}
