{ pkgs, ... }:
{
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;

    style = "square";
    width = 5.0;
    hidpi = true;
    active_color = "0xff56526e";
    inactive_color = "0xff414550";
    whitelist = [
      "kitty"
      "Zed"
    ];
  };
}
