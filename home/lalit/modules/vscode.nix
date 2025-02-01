{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;

    mutableExtensionsDir = false;
    extensions = with pkgs; [
      vscode-extensions.christian-kohler.path-intellisense
      vscode-extensions.christian-kohler.npm-intellisense
      vscode-extensions.catppuccin.catppuccin-vsc
      vscode-extensions.eamodio.gitlens
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.ms-azuretools.vscode-docker
      vscode-extensions.ms-vscode-remote.remote-containers
      vscode-extensions.ms-vscode-remote.remote-ssh
      vscode-extensions.ms-vscode-remote.remote-ssh-edit
      vscode-extensions.ms-vscode-remote.remote-containers
      vscode-extensions.naumovs.color-highlight
      vscode-extensions.prisma.prisma
      vscode-extensions.sumneko.lua
      vscode-extensions.svelte.svelte-vscode
      vscode-extensions.wix.vscode-import-cost
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.ms-python.python
      vscode-extensions.rust-lang.rust-analyzer
      vscode-extensions.ziglang.vscode-zig
      vscode-marketplace.bradlc.vscode-tailwindcss
      vscode-marketplace.oven.bun-vscode
      vscode-marketplace.ms-vscode.atom-keybindings
      vscode-marketplace.moalamri.inline-fold
      vscode-marketplace.mongodb.mongodb-vscode
      vscode-marketplace.miguelsolorio.symbols
    ];

    userSettings = {
      editor = {
        copyWithSyntaxHighlighting = false;
        emptySelectionClipboard = true;
        multiCursorModifier = "ctrlCmd";
        snippetSuggestions = "top";
        detectIndentation = true;
        minimap.enabled = false;
        guides.indentation = false;
        hover.delay = 1500;
        hover.enabled = true;
        colorDecorators = false;
        lightbulb.enabled = "off";
        selectionHighlight = false;
        overviewRulerBorder = false;
        renderLineHighlight = "none";
        occurrencesHighlight = "off";
        renderControlCharacters = false;
        hideCursorInOverviewRuler = true;
        gotoLocation = {
          multipleReferences = "goto";
          multipleDefinitions = "goto";
          multipleDeclarations = "goto";
          multipleImplementations = "goto";
          multipleTypeDefinitions = "goto";
        };
        suggestLineHeight = 30;
        fontLigatures = true;
        wordSeparators = "`~!@#%^&*()=+[{]}\\|;:'\",.<>/?";
        defaultFormatter = "esbenp.prettier-vscode";
        formatOnSave = true;
        tabSize = 2;
      };

      workbench.iconTheme = "symbols";
      terminal.integrated.cursorStyle = "underline";
      terminal.integrated.fontFamily = config.stylix.fonts.monospace.name;

      # nix stuff
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

      # svelte typscript
      svelte.enable-ts-plugin = true;

      # formatters
      "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";
      "[lua]".editor.defaultFormatter = "sumneko.lua";
      "[python]".editor.defaultFormatter = "ms-python.black-formatter";
      "[rust]".editor.defaultFormatter = "rust-lang.rust-analyzer";
    };
  };
}
