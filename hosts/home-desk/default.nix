{ ... }:
{
  imports = [
    ../modules/common.nix
  ];

  services.aerospace.settings.gaps.outer.top = 56;
}
