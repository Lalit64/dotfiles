{ pkgs, ... }: {
  programs.cava = {
    enable = true;
    package = pkgs.cava;

    settings = {
      # General
      general = {
        framerate  = 120;
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

      # Color
      color = {
        gradient = 1;
        gradient_count = 6;
        gradient_color_1 = "'#3e8fb0'";
        gradient_color_2 = "'#9ccfd8'";
        gradient_color_3 = "'#c4a7e7'";
        gradient_color_4 = "'#ea9a97'";
        gradient_color_5 = "'#f6c177'";
        gradient_color_6 = "'#eb6f92'";
      };

      # Smoothing
      smoothing = {
        monstercat = 0;
        waves = 0;
        gravity = 100;
      };
    };

  };
}
