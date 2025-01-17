{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
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
        detectIndentation = false;
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
        gotoLocation.multipleReferences = "goto";
        gotoLocation.multipleDefinitions = "goto";
        gotoLocation.multipleDeclarations = "goto";
        gotoLocation.multipleImplementations = "goto";
        gotoLocation.multipleTypeDefinitions = "goto";
        suggestLineHeight = 30;
        fontLigatures = true;
        wordSeparators = "`~!@#%^&*()=+[{]}\\|;:'\",.<>/?";
        defaultFormatter = "esbenp.prettier-vscode";
        formatOnSave = true;
      };

      workbench.iconTheme = "symbols";
      terminal.integrated.cursorStyle = "underline";

      # nix stuff
      nix.enableLanguageServer = true;
      nix.formatterPath = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      nix.serverPath = "${pkgs.nil}/bin/nil";
      nix.serverSettings = {
        nil = {
          formatting = {
            command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
          };
        };
      };

      # formatters
      "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";
      "[lua]".editor.defaultFormatter = "sumneko.lua";
      "[python]".editor.defaultFormatter = "ms-python.black-formatter";
    };
  };
}
