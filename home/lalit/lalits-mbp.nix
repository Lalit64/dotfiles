{ ... }:
{
  imports = [
    ./modules/common.nix
  ];

  # Ensure homebrew is in the PATH
  home.sessionPath = [
    "/opt/homebrew/bin/"
  ];

  # backwards compat; don't change
  home.stateVersion = "24.11";
}
