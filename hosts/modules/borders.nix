{ pkgs, ... }:
{
  services.jankyborders = {
    enable = false;
    package = pkgs.jankyborders;

    style = "round";
    width = 3.0;
    hidpi = true;

    whitelist = [
      "ghostty"
      "kitty"
    ];
  };
}
