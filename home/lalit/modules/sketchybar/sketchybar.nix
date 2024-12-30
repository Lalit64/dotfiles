{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.activation.sketchybar = lib.hm.dag.entryAfter [
    "writeBoundary"
  ] "${pkgs.sketchybar}/bin/sketchybar --reload";
  home.file."/Users/lalit/.config/sketchybar".source =
    config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/modules/sketchybar";
}
