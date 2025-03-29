[
  {
    bindings = {
      cmd-shift-g = "git_panel::ToggleFocus";
      cmd-shift-w = "workspace::ToggleBottomDock";
    };
  }
  {
    bindings = {
      cmd-d = "editor::DuplicateLineDown";
      "cmd-k cmd-i" = "editor::SortLinesCaseInsensitive";
      cmd-shift-left = [
        "editor::SelectToBeginningOfLine"
        { stop_at_soft_wraps = true; }
      ];
      cmd-shift-right = [
        "editor::SelectToEndOfLine"
        { stop_at_soft_wraps = true; }
      ];
    };
    context = "Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-0 = "pane::ActivateLastItem";
      cmd-1 = [ "pane::ActivateItem" ] ++ [ 0 ];
      cmd-2 = [ "pane::ActivateItem" ] ++ [ 1 ];
      cmd-3 = [ "pane::ActivateItem" ] ++ [ 2 ];
      cmd-4 = [ "pane::ActivateItem" ] ++ [ 3 ];
      cmd-5 = [ "pane::ActivateItem" ] ++ [ 4 ];
      cmd-6 = [ "pane::ActivateItem" ] ++ [ 5 ];
      cmd-7 = [ "pane::ActivateItem" ] ++ [ 6 ];
      cmd-8 = [ "pane::ActivateItem" ] ++ [ 7 ];
      cmd-9 = [ "pane::ActivateItem" ] ++ [ 8 ];
      cmd-ctrl-down = "workspace::ActivatePaneDown";
      cmd-ctrl-left = "workspace::ActivatePaneLeft";
      cmd-ctrl-right = "workspace::ActivatePaneRight";
      cmd-ctrl-up = "workspace::ActivatePaneUp";
    };
    context = "Workspace";
  }
  {
    bindings = {
      cmd-shift-t = "workspace::NewTerminal";
    };
    context = "Terminal";
  }
]
