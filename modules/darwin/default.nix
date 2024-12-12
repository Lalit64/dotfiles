{ pkgs, ... }: {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  users.users.guto.home = "/Users/lalit";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  imports = [
    ./settings/system.nix
    ./settings/environment.nix
    ./settings/yabai.nix
    ./settings/homebrew.nix
    ./settings/jankyborders.nix
    # ./settings/karabiner-elements.nix
  ];
}
