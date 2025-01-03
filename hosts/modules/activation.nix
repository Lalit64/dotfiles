{
  config,
  pkgs,
  lib,
  wallpaper,
  ...
}:
with lib;
let
  cfg = config.local;
  inherit (pkgs) stdenv dockutil;
in
{
  options = {
    local.wallpaper = {
      enable = mkOption {
        description = "Set wallpaper";
        default = false;
      };
    };

    local.dock.enable = mkOption {
      description = "Enable dock";
      default = stdenv.isDarwin;
      example = false;
    };

    local.dock.entries = mkOption {
      description = "Entries on the Dock";
      type =
        with types;
        listOf (submodule {
          options = {
            path = lib.mkOption { type = str; };
            section = lib.mkOption {
              type = str;
              default = "apps";
            };
            options = lib.mkOption {
              type = str;
              default = "";
            };
          };
        });
      readOnly = true;
    };
  };

  config = mkIf cfg.dock.enable (
    let
      normalize = path: if hasSuffix ".app" path then path + "/" else path;
      entryURI =
        path:
        "file://"
        + (builtins.replaceStrings
          [
            " "
            "!"
            "\""
            "#"
            "$"
            "%"
            "&"
            "'"
            "("
            ")"
          ]
          [
            "%20"
            "%21"
            "%22"
            "%23"
            "%24"
            "%25"
            "%26"
            "%27"
            "%28"
            "%29"
          ]
          (normalize path)
        );
      wantURIs = concatMapStrings (entry: "${entryURI entry.path}\n") cfg.dock.entries;
      createEntries = concatMapStrings (
        entry:
        "${dockutil}/bin/dockutil --no-restart --add '${entry.path}' --section ${entry.section} ${entry.options}\n"
      ) cfg.dock.entries;
    in
    {
      system.activationScripts.postUserActivation.text = ''
        sudo ${pkgs.yabai}/bin/yabai --load-sa
         # Wallpaper
         echo >&2 "Setting the wallpaper..."
        osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${wallpaper}"'
         # Dock
         echo >&2 "Setting up the Dock..."
         haveURIs="$(${dockutil}/bin/dockutil --list | ${pkgs.coreutils}/bin/cut -f2)"
         if ! diff -wu <(echo -n "$haveURIs") <(echo -n '${wantURIs}') >&2 ; then
           echo >&2 "Resetting Dock."
           ${dockutil}/bin/dockutil --no-restart --remove all
           ${createEntries}
           killall Dock
         else
           echo >&2 "Dock setup complete."
         fi
      '';
    }
  );
}
