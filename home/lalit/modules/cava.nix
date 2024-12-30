{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
    package = pkgs.cava;

    settings = {
      # General
      general = {
        framerate = 120;
        autosens = 4;
        overshoot = 0;
        sensitivity = 40;
        bars = 0;
        bar_width = 3.0;
        bar_spacing = 1.0;
      };

      # Input
      input = {
        method = "portaudio";
        source = "Background Music";
      };

      # Output
      output.channels = "mono";

      # Smoothing
      smoothing = {
        monstercat = 0;
        waves = 0;
        gravity = 100;
      };
    };
  };
}
