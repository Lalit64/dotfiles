{ pkgs, ... }:
{
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;

    style = "round";
    width = 3.0;
    hidpi = true;
    active_color = "0xffac8fd4";
    inactive_color = "0xffac8fd4";
    whitelist = [
      "ghostty"
      "kitty"
    ];
  };
}
