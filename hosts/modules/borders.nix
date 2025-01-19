{ pkgs, ... }:
{
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;

    style = "round";
    width = 3.0;
    hidpi = true;
    active_color = "0xff89b4fa";
    inactive_color = "0xff56526e";
    whitelist = [
      "kitty"
    ];
  };
}
