{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      christian-kohler.path-intellisense
      christian-kohler.npm-intellisense
      catppuccin.catppuccin-vsc
      eamodio.gitlens
      esbenp.prettier-vscode
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-containers
      naumovs.color-highlight
      prisma.prisma
      sumneko.lua
      svelte.svelte-vscode
      wix.vscode-import-cost
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Get sha256 using
        # nix hash to-sri --type sha256 $(nix-prefetch-url https://marketplace.visualstudio.com/_apis/public/gallery/publishers/<author>/vsextensions/<extension>/<version>/vspackage)
         {
             name = "wal-theme";
             publisher = "dlasagno";
             version = "1.2.0";
             sha256 = "sha256-X16N5ClNVLtWST64ybJUEIRo6WgDCzODhBA9ScAHI5w=";
         }
         {
             name = "catppuccin-noctis";
             publisher = "AlexDauenhauer";
             version = "3.1.5";
             sha256 = "sha256-COsfeYWDMajTFh7nFKJSQIwZ/iYE+A4Pi/gS0XADEtI=";
         }
     ];

     userSettings = {
       editor = {
          copyWithSyntaxHighlighting = false;
          emptySelectionClipboard = false;
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
          fontFamily = "JetBrainsMono Nerd Font Mono";
          suggestFontSize = 13;
          suggestLineHeight = 30;
          fontLigatures = true;
          editor.wordSeparators = "`~!@#%^&*()=+[{]}\\|;:'\",.<>/?";
       };

       "[javascript]" = {
         editor.defaultFormatter = "esbenp.prettier-vscode";
         editor.formatOnSave = true;
       };
       "[typescriptreact]" = {
         editor.defaultFormatter = "esbenp.prettier-vscode";
         editor.formatOnSave = true;
       };
       "[tailwindcss]" = {
         editor.defaultFormatter = "esbenp.prettier-vscode";
         editor.formatOnSave = true;
       };
       "[vue]" = {
         editor.defaultFormatter = "esbenp.prettier-vscode";
         editor.formatOnSave = true;
       };
       "[javascriptreact]" = {
         editor.defaultFormatter = "esbenp.prettier-vscode";
         editor.formatOnSave = true;
       };

       workbench.colorTheme = "Catppuccin Noctis Mocha";
       terminal.integrated.cursorStyle = "underline";
     };
  };
}
