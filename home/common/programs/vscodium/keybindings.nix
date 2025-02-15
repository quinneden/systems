{ lib, pkgs, ... }:

with lib;

let
  inherit (pkgs.stdenv) isDarwin isLinux;

  intPairs = {
    "1" = "First";
    "2" = "Second";
    "3" = "Third";
    "4" = "Fourth";
    "5" = "Fifth";
    "6" = "Sixth";
    "7" = "Seventh";
    "8" = "Eighth";
    "9" = "Last";
  };

  mods = [
    "ctrl"
    "meta"
  ];

  _mod = if isDarwin then "meta" else "ctrl";
  _mod' = if isLinux then "meta" else "ctrl";

  unbind = [ "cursorWordLeftSelect" ];
in
concatLists (
  map (
    mod:
    let
      modShift = "${mod}+shift";
    in
    [
      {
        command = "editor.action.commentLine";
        key = "${mod}+/";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        command = "editor.action.duplicateSelection";
        key = "${mod}+d";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        command = "workbench.action.focusPreviousGroup";
        key = "${modShift}+left";
      }
      {
        command = "explorer.newFile";
        key = "${mod}+n";
        when = "explorerViewletFocus";
      }
      {
        command = "workbench.action.focusNextGroup";
        key = "${modShift}+right";
      }
      {
        command = "editor.action.blockComment";
        key = "${modShift}+/";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        command = "workbench.view.explorer";
        key = "${modShift}+e";
        when = "viewContainer.workbench.view.explorer.enabled";
      }
      {
        command = "workbench.action.findInFiles";
        key = "${modShift}+f";
      }
      {
        command = "copilot-chat.focus";
        key = "${modShift}+i";
      }
      {
        command = "explorer.newFolder";
        key = "${modShift}+n";
        when = "explorerViewletFocus";
      }
      {
        command = "workbench.action.terminal.toggleTerminal";
        key = "${modShift}+w";
        when = "terminal.active";
      }
      {
        command = "redo";
        key = "${modShift}+z";
      }
      {
        command = "undo";
        key = "${mod}+z";
      }
      {
        command = "workbench.action.files.save";
        key = "${mod}+s";
        when = "editorFocus";
      }
    ]
  ) mods
)
++ map (cmd: {
  command = cmd;
  key = "";
}) unbind
++ map (n: {
  key = "${_mod}+${toString n}";
  command = "workbench.action.openEditorAtIndex${toString n}";
}) (range 1 9)
++ mapAttrsToList (n: o: {
  key = "${_mod'}+${n}";
  command = "workbench.action.focus${o}EditorGroup";
}) intPairs
