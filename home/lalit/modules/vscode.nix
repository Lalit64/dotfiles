{
  inputs,
  system,
  config,
  pkgs,
  ...
}:
let
  vscode-marketplace = with inputs.nix-vscode-extensions.extensions."${system}".vscode-marketplace; [
    ms-vscode.atom-keybindings
    miguelsolorio.symbols
  ];

in
# open-vsx = with inputs.nix-vscode-extensions.extensions."${system}".open-vsx; [
# ];
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    profiles = {
      default = {
        enableUpdateCheck = false;
        extensions =
          with pkgs.vscode-extensions;
          [
            jnoortheen.nix-ide
            esbenp.prettier-vscode
            aaron-bond.better-comments
            mvllow.rose-pine
            prisma.prisma
            sumneko.lua
            svelte.svelte-vscode
            christian-kohler.path-intellisense
            wix.vscode-import-cost
            ms-python.python
            rust-lang.rust-analyzer
            ziglang.vscode-zig
            vscodevim.vim
            formulahendry.auto-close-tag
            formulahendry.auto-rename-tag
            jock.svg
            visualstudioexptteam.vscodeintellicode
          ]
          ++ vscode-marketplace;
        # ++ open-vsx;
        userSettings = {
          # appearance
          editor.fontFamily = config.stylix.fonts.monospace.name;
          editor.fontLigatures = true;
          editor.lineHeight = 34;
          workbench.colorTheme = "Stylix";
          workbench.iconTheme = "symbols"; # miguelsolorio.symbols
          editor.minimap.enabled = false;
          workbench.tips.enabled = false;
          breadcrumbs.enabled = true;
          editor.stickyScroll.enabled = false;
          workbench.startupEditor = "newUntitledFile";
          # tabs and titlebar
          workbench.editor.showTabs = "multiple";
          window.commandCenter = false;

          # small preferences
          git.blame.editorDecoration.enabled = true;
          git.decorations.enabled = false;
          editor.emptySelectionClipboard = true;
          editor.multiCursorModifier = "ctrlCmd";
          editor.defaultFormatter = "esbenp.prettier-vscode";
          editor.formatOnSave = true;
          editor.tabSize = 2;
          editor.cursorSmoothCaretAnimation = "on";
          editor.cursorBlinking = "smooth";

          # vscodevim
          extensions.experimental.affinity = {
            vscodevim.vim = 1;
          };
          vim.useSystemClipboard = true;
          vim.hlsearch = true;
          editor.cursorSurroundingLines = 6;
          vim.smartRelativeLine = true;
          vim.highlightedyank.enable = true;
          vim.highlightedyank.color = "rgba(137, 180, 250, 0.5)";
          vim.highlightedyank.textColor = "#1E1E2E";
          vim.highlightedyank.duration = 150;
          vim.leader = "<space>";
          vim.normalModeKeyBindings = [
            {
              before = [
                "<leader>"
                "f"
                "f"
              ];
              commands = [ "workbench.action.quickOpen" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "w"
              ];
              commands = [ "workbench.action.findInFiles" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "o"
              ];
              commands = [ "workbench.action.files.openFileFolder" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "p"
              ];
              commands = [ "workbench.action.openRecent" ];
            }
            {
              before = [
                "<leader>"
                "f"
                "m"
              ];
              after = [
                "editor.action.formatDocument"
              ];
            }
            {
              before = [
                "<leader>"
                "f"
                "n"
              ];
              commands = [ "workbench.action.files.newUntitledFile" ];
            }
            {
              before = [
                "<leader>"
                "e"
              ];
              commands = [ "workbench.action.toggleSidebarVisibility" ];
            }
          ];

          # language settings
          nix = {
            enableLanguageServer = true;
            formatterPath = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
            serverPath = "${pkgs.nil}/bin/nil";
            serverSettings = {
              nil = {
                formatting = {
                  command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
                };
              };
            };
          };

          svelte.enable-ts-plugin = true;

          "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";
          "[lua]".editor.defaultFormatter = "sumneko.lua";
          "[python]".editor.defaultFormatter = "ms-python.black-formatter";
          "[rust]".editor.defaultFormatter = "rust-lang.rust-analyzer";
          "[svelte]".editor.defaultFormatter = "svelte.svelte-vscode";
        };
      };
    };
  };
}
