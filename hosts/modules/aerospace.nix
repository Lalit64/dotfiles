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

      accordion-padding = 14;

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
          bottom = 16;
          left = 16;
          right = 16;
        };
        inner = {
          horizontal = 16;
          vertical = 16;
        };
      };

      on-window-detected = [
        ####### Floating Windows #######
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
            app-id = "dev.kdrag0n.MacVirt";
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
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.utmapp.UTM";
          };
          run = [
            "layout floating"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "org.qbittorrent.qBittorrent";
          };
          run = [
            "layout floating"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.vmware.fusion";
          };
          run = [
            "layout floating"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.aone.keka";
          };
          run = [
            "layout floating"
          ];
        }
        ####### Specific spaces for apps #######
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "app.zen-browser.zen";
          };
          run = [
            "move-node-to-workspace 1"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.vscodium";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "dev.zed.Zed";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "net.kovidgoyal.kitty";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "md.obsidian";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "info.sioyek.sioyek";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "us.zoom.xos";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "dev.vencord.vesktop";
          };
          run = [
            "move-node-to-workspace 3"
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

        ctrl-cmd-shift-0 = "balance-sizes";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";

        ctrl-cmd-shift-1 = [
          "move-node-to-workspace 1"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];
        ctrl-cmd-shift-2 = [
          "move-node-to-workspace 2"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];
        ctrl-cmd-shift-3 = [
          "move-node-to-workspace 3"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];
        ctrl-cmd-shift-4 = [
          "move-node-to-workspace 4"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];
        ctrl-cmd-shift-5 = [
          "move-node-to-workspace 5"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];
        ctrl-cmd-shift-6 = [
          "move-node-to-workspace 6"
          "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --trigger space_windows_change"
        ];

        ctrl-cmd-shift-space = "layout floating tiling";
        ctrl-cmd-shift-minus = "resize smart -50";
        ctrl-cmd-shift-equal = "resize smart +50";

        alt-leftSquareBracket = "join-with left";
        alt-rightSquareBracket = "join-with right";

        alt-slash = "layout horizontal vertical";

        ctrl-cmd-shift-r = "exec-and-forget ${pkgs.sketchybar}/bin/sketchybar --reload && aerospace reload-config";

        alt-t = "exec-and-forget open -a Ghostty.app";
        alt-e = ''exec-and-forget open -a "Twilight.app"'';
        alt-c = "exec-and-forget open -a Zed.app";
        alt-d = "exec-and-forget open -a Obsidian.app";
      };
    };
  };
}
