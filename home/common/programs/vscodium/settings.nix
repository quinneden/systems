{
  lib,
  pkgs,
  ...
}:
{
  "black-formatter.path" = [ (lib.getExe pkgs.black) ];

  "breadcrums.enabled" = false;

  "chat.commandCenter.enabled" = false;

  "editor.fontFamily" = lib.mkForce "CaskaydiaCoveNFM-SemiLight";
  "editor.fontLigatures" = true;
  "editor.fontSize" = lib.mkForce 15;
  "editor.fontWeight" = "500";
  "editor.formatOnPaste" = false;
  "editor.formatOnSave" = true;
  "editor.guides.indentation" = true;
  "editor.minimap.enabled" = false;
  "editor.scrollbar.horizontal" = "hidden";
  "editor.scrollbar.vertical" = "hidden";
  "editor.tabSize" = 2;

  "explorer.compactFolders" = false;
  "explorer.fileNesting.enabled" = false;

  "extensions.ignoreRecommendations" = true;

  "git.openRepositoryInParentFolders" = "always";
  "github.copilot.advanced" = {
    "useLanguageServer" = true;
  };
  "github.copilot.enable" = {
    "*" = true;
    "plaintext" = false;
    "markdown" = true;
    "scminput" = false;
  };

  "markdown-preview-enhanced.automaticallyShowPreviewOfMarkdownBeingEdited" = true;
  "markdown-preview-enhanced.codeBlockTheme" = "github-dark.css";
  "markdown-preview-enhanced.previewTheme" = "github-dark.css";
  "markdown.preview.fontSize" = lib.mkForce 14;

  "nix.enableLanguageServer" = true;
  "nix.formatterPath" = lib.getExe pkgs.nixfmt-rfc-style;
  "nix.serverPath" = lib.getExe pkgs.nil;
  "nix.serverSettings" = {
    "nil" = {
      "formatting" = {
        "command" = [ "nixfmt" ];
      };
    };
  };

  "terminal.integrated.cursorStyle" = "line";
  "terminal.integrated.defaultProfile.linux" = "zsh";
  "terminal.integrated.defaultProfile.osx" = "zsh";
  "terminal.integrated.fontFamily" = lib.mkForce "CaskaydiaCoveNFM-SemiLight";
  "terminal.integrated.fontLigatures" = true;
  "terminal.integrated.fontSize" = lib.mkForce 15;
  "terminal.integrated.fontWeightBold" = 500;
  "terminal.integrated.gpuAcceleration" = "auto";
  "terminal.integrated.letterSpacing" = 0.5;
  "terminal.integrated.persistentSessionReviveProcess" = "never";
  "terminal.integrated.sendKeybindingsToShell" = true;
  "terminal.integrated.shellIntegration" = false;
  "terminal.integrated.showExitAlert" = false;

  "window.commandCenter" = true;
  "window.customMenuBarAltFocus" = false;
  "window.menuBarVisibility" = "compact";
  "window.restoreFullscreen" = true;
  "window.titleBarStyle" = "custom";
  "window.zoomLevel" = if pkgs.stdenv.isDarwin then 0.3 else 0.4;

  "workbench.activityBar.location" = "bottom";
  "workbench.colorTheme" = "oh-lucy";
  "workbench.editor.closeOnFileDelete" = true;
  "workbench.editor.editorActionsLocation" = "titleBar";
  "workbench.editor.labelFormat" = "short";
  "workbench.iconTheme" = "symbols";
  "workbench.layoutControl.enabled" = true;
  "workbench.settings.useSplitJSON" = true;
  "workbench.tree.indent" = 17;
  "workbench.view.showQuietly" = {
    "workbench.panel.output" = true;
  };

  "zenMode.hideLineNumbers" = false;
  "zenMode.restore" = false;
}
