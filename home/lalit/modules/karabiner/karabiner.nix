{ username, ... }:
{
  home.file."/Users/${username}/.config/karabiner/karabiner.json".source = ./karabiner.json;
}
