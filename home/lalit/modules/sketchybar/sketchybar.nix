{
  inputs,
  system,
  pkgs,
  ...
}:
{
  home.file = {
    ".config/sketchybar" = {
      source = ./.;
      recursive = true;
      onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
    };
    ".local/share/sketchybar_lua/sketchybar.so" = {
      source = "${inputs.sbarlua.packages."${system}".sbarlua}/lib/sketchybar.so";
      onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
    };
    ".config/sketchybar/sketchybarrc" = {
      text = ''
        #!/usr/bin/env ${pkgs.lua54Packages.lua}/bin/lua
        -- Load the sketchybar-package and prepare the helper binaries
        require("helpers")
        require("init")

        -- Enable hot reloading
        sbar.exec("sketchybar --hotload true")
      '';
      executable = true;
      onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
    };
  };
}
