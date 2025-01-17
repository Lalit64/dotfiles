{ pkgs, ... }:
{
  services.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    settings = {
      after-login-command = [ ];
      after-startup-command = [ ];

      key-mapping.preset = "qwerty";

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 12;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "horizontal";

      exec-on-workspace-change = [
        "/bin/zsh"
        "-c"
        "${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_workspace_changed FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];

      on-focus-changed = [
        "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger front_app_switched"
      ];

      gaps = {
        outer = {
          top = 20;
          bottom = 14;
          left = 14;
          right = 14;
        };
        inner = {
          horizontal = 14;
          vertical = 14;
        };
      };

      on-window-detected = [
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.apple.finder";
          };
          run = [
            "layout floating"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.github.th-ch.youtube-music";
          };
          run = [
            "layout floating"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.apple.Passwords";
          };
          run = [
            "layout floating"
          ];
        }
      ];

      mode.main.binding = {
        cmd-alt-h = [ ];

        alt-tab = "workspace-back-and-forth";

        alt-left = "focus left";
        alt-down = "focus down";
        alt-up = "focus up";
        alt-right = "focus right";

        ctrl-cmd-shift-left = "move left";
        ctrl-cmd-shift-down = "move down";
        ctrl-cmd-shift-up = "move up";
        ctrl-cmd-shift-right = "move right";

        alt-cmd-b = "balance-sizes";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";

        ctrl-cmd-shift-1 = "move-node-to-workspace 1";
        ctrl-cmd-shift-2 = "move-node-to-workspace 2";
        ctrl-cmd-shift-3 = "move-node-to-workspace 3";
        ctrl-cmd-shift-4 = "move-node-to-workspace 4";
        ctrl-cmd-shift-5 = "move-node-to-workspace 5";
        ctrl-cmd-shift-6 = "move-node-to-workspace 6";

        alt-m = "exec-and-forget s${pkgs.sketchybar}/bin/sketchybar --trigger aerospace_switch";

        ctrl-cmd-shift-space = "layout floating tiling";
        ctrl-cmd-shift-minus = "resize smart -50";
        ctrl-cmd-shift-equal = "resize smart +50";

        alt-leftSquareBracket = "join-with left";
        alt-rightSquareBracket = "join-with right";

        alt-slash = "layout horizontal vertical";

        ctrl-cmd-shift-r = "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --reload";
      };
    };
  };
}
