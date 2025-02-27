[
  {
    bindings = {
      alt-cmd-h = "zed::HideOthers";
      alt-shift-enter = "menu::Restart";
      "cmd-+" = "zed::IncreaseBufferFontSize";
      "cmd-," = "zed::OpenSettings";
      cmd-- = "zed::DecreaseBufferFontSize";
      cmd-0 = "zed::ResetBufferFontSize";
      "cmd-=" = "zed::IncreaseBufferFontSize";
      cmd-down = "menu::SelectLast";
      cmd-enter = "menu::SecondaryConfirm";
      cmd-escape = "menu::Cancel";
      cmd-h = "zed::Hide";
      cmd-m = "zed::Minimize";
      cmd-o = "workspace::Open";
      cmd-q = "zed::Quit";
      cmd-shift-w = "workspace::ToggleBottomDock";
      cmd-up = "menu::SelectFirst";
      ctrl-c = "menu::Cancel";
      ctrl-cmd-f = "zed::ToggleFullScreen";
      ctrl-cmd-i = "edit_prediction::ToggleMenu";
      ctrl-cmd-z = "edit_prediction::RateCompletions";
      ctrl-enter = "menu::SecondaryConfirm";
      ctrl-escape = "menu::Cancel";
      ctrl-n = "menu::SelectNext";
      ctrl-p = "menu::SelectPrev";
      down = "menu::SelectNext";
      end = "menu::SelectLast";
      enter = "menu::Confirm";
      escape = "menu::Cancel";
      fn-f = "zed::ToggleFullScreen";
      home = "menu::SelectFirst";
      pagedown = "menu::SelectLast";
      pageup = "menu::SelectFirst";
      shift-escape = "workspace::ToggleZoom";
      shift-pagedown = "menu::SelectLast";
      shift-pageup = "menu::SelectFirst";
      shift-tab = "menu::SelectPrev";
      tab = "menu::SelectNext";
      up = "menu::SelectPrev";
    };
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-backspace = "editor::DeleteToPreviousWordStart";
      alt-ctrl-f12 = "editor::GoToDeclarationSplit";
      alt-delete = "editor::DeleteToNextWordEnd";
      alt-left = "editor::MoveToPreviousWordStart";
      alt-right = "editor::MoveToNextWordEnd";
      alt-shift-left = "editor::SelectToPreviousWordStart";
      alt-shift-right = "editor::SelectToNextWordEnd";
      "cmd-\"" = "editor::ExpandAllHunkDiffs";
      cmd-' = "editor::ToggleSelectedDiffHunks";
      "cmd-;" = "editor::ToggleLineNumbers";
      cmd-a = "editor::SelectAll";
      "cmd-alt-g b" = "editor::ToggleGitBlame";
      cmd-alt-z = "editor::RevertSelectedHunks";
      cmd-backspace = "editor::DeleteToBeginningOfLine";
      cmd-c = "editor::Copy";
      cmd-delete = "editor::DeleteToEndOfLine";
      cmd-down = "editor::MoveToEnd";
      cmd-i = "editor::ShowSignatureHelp";
      cmd-l = "editor::SelectLine";
      cmd-left = "editor::MoveToBeginningOfLine";
      cmd-pagedown = "editor::PageDown";
      cmd-pageup = "editor::PageUp";
      cmd-right = "editor::MoveToEndOfLine";
      cmd-shift-down = "editor::SelectToEnd";
      cmd-shift-i = "editor::Format";
      cmd-shift-left = [
        "editor::SelectToBeginningOfLine"
        { stop_at_soft_wraps = true; }
      ];
      cmd-shift-right = [
        "editor::SelectToEndOfLine"
        { stop_at_soft_wraps = true; }
      ];
      cmd-shift-up = "editor::SelectToBeginning";
      cmd-shift-z = "editor::Redo";
      cmd-up = "editor::MoveToBeginning";
      cmd-v = "editor::Paste";
      cmd-x = "editor::Cut";
      cmd-z = "editor::Undo";
      ctrl-a = "editor::MoveToBeginningOfLine";
      ctrl-b = "editor::MoveLeft";
      ctrl-cmd-e = "editor::ToggleEditPrediction";
      ctrl-cmd-space = "editor::ShowCharacterPalette";
      ctrl-down = "editor::MoveToEndOfParagraph";
      ctrl-e = "editor::MoveToEndOfLine";
      ctrl-f12 = "editor::GoToDeclaration";
      ctrl-h = "editor::Backspace";
      ctrl-k = "editor::KillRingCut";
      ctrl-l = "editor::ScrollCursorCenter";
      ctrl-n = "editor::MoveDown";
      ctrl-p = "editor::MoveUp";
      ctrl-pagedown = "editor::LineDown";
      ctrl-pageup = "editor::LineUp";
      ctrl-shift-a = [
        "editor::SelectToBeginningOfLine"
        { stop_at_soft_wraps = true; }
      ];
      ctrl-shift-b = "editor::SelectLeft";
      ctrl-shift-down = "editor::SelectToEndOfParagraph";
      ctrl-shift-e = [
        "editor::SelectToEndOfLine"
        { stop_at_soft_wraps = true; }
      ];
      ctrl-shift-n = "editor::SelectDown";
      ctrl-shift-p = "editor::SelectUp";
      ctrl-shift-up = "editor::SelectToStartOfParagraph";
      ctrl-shift-v = [
        "editor::MovePageUp"
        { center_cursor = true; }
      ];
      ctrl-t = "editor::Transpose";
      ctrl-up = "editor::MoveToStartOfParagraph";
      ctrl-v = [
        "editor::MovePageDown"
        { center_cursor = true; }
      ];
      ctrl-y = "editor::KillRingYank";
      delete = "editor::Delete";
      down = "editor::MoveDown";
      end = "editor::MoveToEndOfLine";
      escape = "editor::Cancel";
      home = "editor::MoveToBeginningOfLine";
      left = "editor::MoveLeft";
      pagedown = "editor::MovePageDown";
      pageup = "editor::MovePageUp";
      right = "editor::MoveRight";
      shift-backspace = "editor::Backspace";
      shift-down = "editor::SelectDown";
      shift-end = [
        "editor::SelectToEndOfLine"
        { stop_at_soft_wraps = true; }
      ];
      shift-home = [
        "editor::SelectToBeginningOfLine"
        { stop_at_soft_wraps = true; }
      ];
      shift-left = "editor::SelectLeft";
      shift-pagedown = "editor::SelectPageDown";
      shift-pageup = "editor::SelectPageUp";
      shift-right = "editor::SelectRight";
      shift-tab = "editor::TabPrev";
      shift-up = "editor::SelectUp";
      tab = "editor::Tab";
      up = "editor::MoveUp";
    };
    context = "Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-enter = "editor::OpenSelectionsInMultibuffer";
      "cmd-<" = "assistant::InsertIntoEditor";
      "cmd->" = "assistant::QuoteSelection";
      cmd-alt-e = "editor::SelectEnclosingSymbol";
      cmd-alt-f = "buffer_search::DeployReplace";
      cmd-alt-l = [
        "buffer_search::Deploy"
        { selection_search_enabled = true; }
      ];
      cmd-e = [
        "buffer_search::Deploy"
        { focus = false; }
      ];
      cmd-enter = "editor::NewlineBelow";
      cmd-f = "buffer_search::Deploy";
      "cmd-k z" = "editor::ToggleSoftWrap";
      cmd-shift-enter = "editor::NewlineAbove";
      enter = "editor::Newline";
      shift-enter = "editor::Newline";
    };
    context = "Editor && mode == full";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-shift-tab = "editor::PreviousEditPrediction";
      alt-tab = "editor::NextEditPrediction";
      ctrl-cmd-right = "editor::AcceptPartialEditPrediction";
    };
    context = "Editor && mode == full && edit_prediction";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-tab = "editor::ShowEditPrediction";
    };
    context = "Editor && !edit_prediction";
    use_key_equivalents = true;
  }
  {
    bindings = {
      ctrl-enter = "editor::Newline";
      ctrl-shift-enter = "editor::NewlineBelow";
      shift-enter = "editor::Newline";
    };
    context = "Editor && mode == auto_height";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-c = "markdown::Copy";
    };
    context = "Markdown";
    use_key_equivalents = true;
  }
  {
    bindings = {
      ctrl-alt-enter = "repl::RunInPlace";
      ctrl-shift-enter = "repl::Run";
    };
    context = "Editor && jupyter && !ContextEditor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      "cmd-alt-/" = "assistant::ToggleModelSelector";
      cmd-g = "search::SelectNextMatch";
      "cmd-k c" = "assistant::CopyCode";
      "cmd-k h" = "assistant::DeployHistory";
      "cmd-k l" = "assistant::DeployPromptLibrary";
      cmd-n = "assistant::NewContext";
      cmd-shift-e = "project_panel::ToggleFocus";
      cmd-shift-g = "search::SelectPrevMatch";
    };
    context = "AssistantPanel";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-enter = "editor::Newline";
      "cmd-<" = "assistant::InsertIntoEditor";
      "cmd->" = "assistant::QuoteSelection";
      cmd-enter = "assistant::Assist";
      cmd-s = "workspace::Save";
      cmd-shift-enter = "assistant::Edit";
      ctrl-r = "assistant::CycleMessageRole";
      enter = "assistant::ConfirmCommand";
      shift-enter = "assistant::Split";
    };
    context = "ContextEditor > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      "cmd-alt-/" = "assistant2::ToggleModelSelector";
      cmd-alt-e = "assistant2::RemoveAllContext";
      cmd-alt-p = "assistant2::NewPromptEditor";
      cmd-e = "assistant2::ChatMode";
      cmd-n = "assistant2::NewThread";
      cmd-shift-a = "assistant2::ToggleContextPicker";
      cmd-shift-h = "assistant2::OpenHistory";
    };
    context = "AssistantPanel2";
    use_key_equivalents = true;
  }
  {
    bindings = {
      enter = "assistant2::Chat";
    };
    context = "MessageEditor > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      backspace = "assistant2::RemoveFocusedContext";
      down = "assistant2::FocusDown";
      enter = "assistant2::AcceptSuggestedContext";
      left = "assistant2::FocusLeft";
      right = "assistant2::FocusRight";
      up = "assistant2::FocusUp";
    };
    context = "ContextStrip";
    use_key_equivalents = true;
  }
  {
    bindings = {
      backspace = "assistant2::RemoveSelectedThread";
    };
    context = "ThreadHistory";
  }
  {
    bindings = {
      cmd-n = "prompt_library::NewPrompt";
      cmd-shift-s = "prompt_library::ToggleDefaultPrompt";
      cmd-w = "workspace::CloseWindow";
    };
    context = "PromptLibrary";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-enter = "search::SelectAllMatches";
      cmd-alt-f = "search::ToggleReplace";
      cmd-alt-l = "search::ToggleSelection";
      cmd-f = "search::FocusSearch";
      enter = "search::SelectNextMatch";
      escape = "buffer_search::Dismiss";
      shift-enter = "search::SelectPrevMatch";
      tab = "buffer_search::FocusEditor";
    };
    context = "BufferSearchBar";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-enter = "search::ReplaceAll";
      enter = "search::ReplaceNext";
    };
    context = "BufferSearchBar && in_replace > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      down = "search::NextHistoryQuery";
      up = "search::PreviousHistoryQuery";
    };
    context = "BufferSearchBar && !in_replace > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-g = "search::ToggleRegex";
      alt-cmd-x = "search::ToggleRegex";
      cmd-shift-f = "search::FocusSearch";
      cmd-shift-h = "search::ToggleReplace";
      cmd-shift-j = "project_search::ToggleFilters";
      escape = "project_search::ToggleFocus";
    };
    context = "ProjectSearchBar";
    use_key_equivalents = true;
  }
  {
    bindings = {
      down = "search::NextHistoryQuery";
      up = "search::PreviousHistoryQuery";
    };
    context = "ProjectSearchBar > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-enter = "search::ReplaceAll";
      enter = "search::ReplaceNext";
    };
    context = "ProjectSearchBar && in_replace > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-g = "search::ToggleRegex";
      alt-cmd-x = "search::ToggleRegex";
      cmd-shift-h = "search::ToggleReplace";
      cmd-shift-j = "project_search::ToggleFilters";
      escape = "project_search::ToggleFocus";
    };
    context = "ProjectSearchView";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-c = "search::ToggleCaseSensitive";
      alt-cmd-f = "project_search::ToggleFilters";
      alt-cmd-left = "pane::ActivatePrevItem";
      alt-cmd-right = "pane::ActivateNextItem";
      alt-cmd-t = [
        "pane::CloseInactiveItems"
        { close_pinned = false; }
      ];
      alt-cmd-w = "search::ToggleWholeWord";
      alt-cmd-x = "search::ToggleRegex";
      alt-enter = "search::SelectAllMatches";
      cmd-alt-l = "search::ToggleSelection";
      cmd-f = "project_search::ToggleFocus";
      cmd-g = "search::SelectNextMatch";
      "cmd-k cmd-w" = [
        "pane::CloseAllItems"
        { close_pinned = false; }
      ];
      "cmd-k e" = [
        "pane::CloseItemsToTheLeft"
        { close_pinned = false; }
      ];
      "cmd-k shift-enter" = "pane::TogglePinTab";
      "cmd-k t" = [
        "pane::CloseItemsToTheRight"
        { close_pinned = false; }
      ];
      "cmd-k u" = [
        "pane::CloseCleanItems"
        { close_pinned = false; }
      ];
      cmd-shift-g = "search::SelectPrevMatch";
      cmd-shift-h = "search::ToggleReplace";
      cmd-w = [
        "pane::CloseActiveItem"
        { close_pinned = false; }
      ];
      "cmd-{" = "pane::ActivatePrevItem";
      "cmd-}" = "pane::ActivateNextItem";
      ctrl-alt-cmd-w = "workspace::CloseInactiveTabsAndPanes";
      ctrl-shift-pagedown = "pane::SwapItemRight";
      ctrl-shift-pageup = "pane::SwapItemLeft";
    };
    context = "Pane";
    use_key_equivalents = true;
  }
  {
    bindings = {
      "alt-cmd-[" = "editor::Fold";
      "alt-cmd-]" = "editor::UnfoldLines";
      alt-cmd-f12 = "editor::GoToTypeDefinitionSplit";
      alt-down = "editor::MoveLineDown";
      alt-f12 = "editor::GoToDefinitionSplit";
      alt-shift-f12 = "editor::FindAllReferences";
      alt-up = "editor::MoveLineUp";
      "cmd-." = "editor::ToggleCodeActions";
      "cmd-/" = [
        "editor::ToggleComments"
        { advance_downwards = false; }
      ];
      "cmd-[" = "editor::Outdent";
      "cmd-\\" = "pane::SplitRight";
      "cmd-]" = "editor::Indent";
      cmd-alt-down = "editor::AddSelectionBelow";
      cmd-alt-up = "editor::AddSelectionAbove";
      cmd-ctrl-n = "editor::AddSelectionBelow";
      cmd-f12 = "editor::GoToTypeDefinition";
      cmd-f2 = "editor::SelectAllMatches";
      "cmd-k cmd-0" = "editor::FoldAll";
      "cmd-k cmd-1" = [
        "editor::FoldAtLevel"
        1
      ];
      "cmd-k cmd-2" = [
        "editor::FoldAtLevel"
        2
      ];
      "cmd-k cmd-3" = [
        "editor::FoldAtLevel"
        3
      ];
      "cmd-k cmd-4" = [
        "editor::FoldAtLevel"
        4
      ];
      "cmd-k cmd-5" = [
        "editor::FoldAtLevel"
        5
      ];
      "cmd-k cmd-6" = [
        "editor::FoldAtLevel"
        6
      ];
      "cmd-k cmd-7" = [
        "editor::FoldAtLevel"
        7
      ];
      "cmd-k cmd-8" = [
        "editor::FoldAtLevel"
        8
      ];
      "cmd-k cmd-9" = [
        "editor::FoldAtLevel"
        9
      ];
      "cmd-k cmd-[" = "editor::FoldRecursive";
      "cmd-k cmd-]" = "editor::UnfoldRecursive";
      "cmd-k cmd-d" = [
        "editor::SelectNext"
        { replace_newest = true; }
      ];
      "cmd-k cmd-i" = "editor::Hover";
      "cmd-k cmd-j" = "editor::UnfoldAll";
      "cmd-k cmd-l" = "editor::ToggleFold";
      "cmd-k ctrl-cmd-d" = [
        "editor::SelectPrevious"
        { replace_newest = true; }
      ];
      "cmd-k p" = "editor::CopyPath";
      "cmd-k r" = "editor::RevealInFileManager";
      "cmd-k v" = "markdown::OpenPreviewToTheSide";
      cmd-shift-k = "editor::DeleteLine";
      cmd-shift-l = "editor::SelectAllMatches";
      cmd-shift-u = "editor::RedoSelection";
      cmd-shift-v = "markdown::OpenPreview";
      cmd-u = "editor::UndoSelection";
      "cmd-|" = "editor::MoveToEnclosingBracket";
      ctrl-cmd-c = "editor::DisplayCursorNames";
      ctrl-m = "editor::MoveToEnclosingBracket";
      ctrl-shift-left = "editor::SelectSmallerSyntaxNode";
      ctrl-shift-right = "editor::SelectLargerSyntaxNode";
      ctrl-space = "editor::ShowCompletions";
      f12 = "editor::GoToDefinition";
      f2 = "editor::Rename";
      f8 = "editor::GoToDiagnostic";
      shift-f12 = "editor::GoToImplementation";
      shift-f8 = "editor::GoToPrevDiagnostic";
    };
    context = "Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-shift-o = "outline::Toggle";
      ctrl-g = "go_to_line::Toggle";
    };
    context = "Editor && mode == full";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-0 = "pane::ActivateLastItem";
      cmd-1 = [
        "pane::ActivateItem"
        0
      ];
      cmd-2 = [
        "pane::ActivateItem"
        1
      ];
      cmd-3 = [
        "pane::ActivateItem"
        2
      ];
      cmd-4 = [
        "pane::ActivateItem"
        3
      ];
      cmd-5 = [
        "pane::ActivateItem"
        4
      ];
      cmd-6 = [
        "pane::ActivateItem"
        5
      ];
      cmd-7 = [
        "pane::ActivateItem"
        6
      ];
      cmd-8 = [
        "pane::ActivateItem"
        7
      ];
      cmd-9 = [
        "pane::ActivateItem"
        8
      ];
      cmd-shift-f = "pane::DeploySearch";
      ctrl-- = "pane::GoBack";
      ctrl-shift-- = "pane::GoForward";
    };
    context = "Pane";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-b = "branches::OpenRecent";
      alt-cmd-o = "projects::OpenRecent";
      alt-cmd-y = "workspace::CloseAllDocks";
      cmd-1 = [
        "workspace::ActivatePane"
        0
      ];
      cmd-2 = [
        "workspace::ActivatePane"
        1
      ];
      cmd-3 = [
        "workspace::ActivatePane"
        2
      ];
      cmd-4 = [
        "workspace::ActivatePane"
        3
      ];
      cmd-5 = [
        "workspace::ActivatePane"
        4
      ];
      cmd-6 = [
        "workspace::ActivatePane"
        5
      ];
      cmd-7 = [
        "workspace::ActivatePane"
        6
      ];
      cmd-8 = [
        "workspace::ActivatePane"
        7
      ];
      cmd-9 = [
        "workspace::ActivatePane"
        8
      ];
      "cmd-?" = "assistant::ToggleFocus";
      cmd-alt-s = "workspace::SaveAll";
      cmd-b = "workspace::ToggleLeftDock";
      cmd-j = "workspace::ToggleBottomDock";
      "cmd-k cmd-down" = "workspace::ActivatePaneDown";
      "cmd-k cmd-left" = "workspace::ActivatePaneLeft";
      "cmd-k cmd-right" = "workspace::ActivatePaneRight";
      "cmd-k cmd-s" = "zed::OpenKeymap";
      "cmd-k cmd-t" = "theme_selector::Toggle";
      "cmd-k cmd-up" = "workspace::ActivatePaneUp";
      "cmd-k m" = "language_selector::Toggle";
      "cmd-k s" = "workspace::SaveWithoutFormat";
      "cmd-k shift-down" = "workspace::SwapPaneDown";
      "cmd-k shift-left" = "workspace::SwapPaneLeft";
      "cmd-k shift-right" = "workspace::SwapPaneRight";
      "cmd-k shift-up" = "workspace::SwapPaneUp";
      cmd-p = "file_finder::Toggle";
      cmd-r = "workspace::ToggleRightDock";
      cmd-s = "workspace::Save";
      cmd-shift-b = "outline_panel::ToggleFocus";
      cmd-shift-e = "project_panel::ToggleFocus";
      cmd-shift-f = "pane::DeploySearch";
      cmd-shift-h = [
        "pane::DeploySearch"
        { replace_enabled = true; }
      ];
      cmd-shift-m = "diagnostics::Deploy";
      cmd-shift-n = "workspace::NewWindow";
      cmd-shift-p = "command_palette::Toggle";
      cmd-shift-s = "workspace::SaveAs";
      cmd-shift-t = "pane::ReopenClosedItem";
      cmd-shift-x = "zed::Extensions";
      cmd-t = "project_symbols::Toggle";
      ctrl-cmd-o = "projects::OpenRemote";
      ctrl-shift-g = "git_panel::ToggleFocus";
      ctrl-shift-tab = [
        "tab_switcher::Toggle"
        { select_last = true; }
      ];
      ctrl-tab = "tab_switcher::Toggle";
      "ctrl-~" = "workspace::NewTerminal";
      escape = "workspace::Unfollow";
    };
    context = "Workspace";
    use_key_equivalents = true;
  }
  {
    bindings = {
      enter = "editor::ConfirmRename";
    };
    context = "Editor && renaming";
    use_key_equivalents = true;
  }
  {
    bindings = {
      enter = "editor::ConfirmCompletion";
      tab = "editor::ComposeCompletion";
    };
    context = "Editor && showing_completions";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-tab = "editor::AcceptEditPrediction";
      tab = "editor::AcceptEditPrediction";
    };
    context = "Editor && edit_prediction";
  }
  {
    bindings = {
      alt-tab = "editor::AcceptEditPrediction";
    };
    context = "Editor && edit_prediction_conflict";
    use_key_equivalents = true;
  }
  {
    bindings = {
      enter = "editor::ConfirmCodeAction";
    };
    context = "Editor && showing_code_actions";
    use_key_equivalents = true;
  }
  {
    bindings = {
      ctrl-n = "editor::ContextMenuNext";
      ctrl-p = "editor::ContextMenuPrev";
      down = "editor::ContextMenuNext";
      pagedown = "editor::ContextMenuLast";
      pageup = "editor::ContextMenuFirst";
      up = "editor::ContextMenuPrev";
    };
    context = "Editor && (showing_code_actions || showing_completions)";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-alt-i = "zed::DebugElements";
      cmd-shift-c = "collab_panel::ToggleFocus";
      ctrl-alt-cmd-f = "workspace::FollowNextCollaborator";
    };
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-enter = "editor::OpenExcerpts";
      cmd-alt-enter = "editor::OpenExcerptsSplit";
      cmd-f8 = "editor::GoToHunk";
      cmd-shift-e = "pane::RevealInProjectPanel";
      cmd-shift-f8 = "editor::GoToPrevHunk";
      "ctrl-:" = "editor::ToggleInlayHints";
      ctrl-enter = "assistant::InlineAssist";
      shift-enter = "editor::ExpandExcerpts";
    };
    context = "Editor && mode == full";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-shift-a = "editor::ApplyAllDiffHunks";
      cmd-shift-y = "editor::ApplyDiffHunk";
    };
    context = "ProposedChangesEditor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      "cmd-alt-/" = "assistant2::ToggleModelSelector";
      cmd-alt-e = "assistant2::RemoveAllContext";
      cmd-shift-a = "assistant2::ToggleContextPicker";
      "ctrl-[" = "assistant::CyclePreviousInlineAssist";
      "ctrl-]" = "assistant::CycleNextInlineAssist";
    };
    context = "PromptEditor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-enter = "project_search::SearchInNew";
    };
    context = "ProjectSearchBar && !in_replace";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-r = "outline_panel::RevealInFileManager";
      alt-cmd-shift-c = "outline_panel::CopyRelativePath";
      alt-enter = "editor::OpenExcerpts";
      cmd-alt-c = "outline_panel::CopyPath";
      cmd-alt-enter = "editor::OpenExcerptsSplit";
      escape = "menu::Cancel";
      left = "outline_panel::CollapseSelectedEntry";
      right = "outline_panel::ExpandSelectedEntry";
      shift-down = "menu::SelectNext";
      shift-up = "menu::SelectPrev";
      space = "outline_panel::Open";
    };
    context = "OutlinePanel && not_editing";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-cmd-n = "project_panel::NewDirectory";
      alt-cmd-r = "project_panel::RevealInFileManager";
      alt-cmd-shift-c = "project_panel::CopyRelativePath";
      backspace = [
        "project_panel::Trash"
        { skip_prompt = false; }
      ];
      cmd-alt-backspace = [
        "project_panel::Delete"
        { skip_prompt = false; }
      ];
      cmd-alt-c = "project_panel::CopyPath";
      cmd-backspace = [
        "project_panel::Trash"
        { skip_prompt = true; }
      ];
      cmd-c = "project_panel::Copy";
      cmd-d = "project_panel::Duplicate";
      cmd-delete = [
        "project_panel::Delete"
        { skip_prompt = false; }
      ];
      cmd-n = "project_panel::NewFile";
      cmd-shift-f = "project_panel::NewSearchInDirectory";
      cmd-v = "project_panel::Paste";
      cmd-x = "project_panel::Cut";
      ctrl-shift-enter = "project_panel::OpenWithSystem";
      delete = [
        "project_panel::Trash"
        { skip_prompt = false; }
      ];
      enter = "project_panel::Rename";
      escape = "menu::Cancel";
      f2 = "project_panel::Rename";
      left = "project_panel::CollapseSelectedEntry";
      right = "project_panel::ExpandSelectedEntry";
      shift-down = "menu::SelectNext";
      shift-up = "menu::SelectPrev";
    };
    context = "ProjectPanel";
    use_key_equivalents = true;
  }
  {
    bindings = {
      space = "project_panel::Open";
    };
    context = "ProjectPanel && not_editing";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-down = "git_panel::FocusEditor";
      cmd-down = "menu::SelectLast";
      cmd-shift-space = "git::StageAll";
      cmd-up = "menu::SelectFirst";
      ctrl-shift-space = "git::UnstageAll";
      down = "menu::SelectNext";
      enter = "menu::Confirm";
      escape = "git_panel::ToggleFocus";
      shift-tab = "git_panel::FocusEditor";
      space = "git::ToggleStaged";
      tab = "git_panel::FocusEditor";
      up = "menu::SelectPrev";
    };
    context = "GitPanel && ChangesList";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-up = "git_panel::FocusChanges";
      cmd-enter = "git::Commit";
      enter = "editor::Newline";
      shift-tab = "git_panel::FocusChanges";
      tab = "git_panel::FocusChanges";
    };
    context = "GitPanel > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      ctrl-backspace = "collab_panel::Remove";
      space = "menu::Confirm";
    };
    context = "CollabPanel && not_editing";
    use_key_equivalents = true;
  }
  {
    bindings = {
      space = "collab_panel::InsertSpace";
    };
    context = "(CollabPanel && editing) > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      tab = "channel_modal::ToggleMode";
    };
    context = "ChannelModal";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-enter = [
        "picker::ConfirmInput"
        { secondary = false; }
      ];
      cmd-alt-enter = [
        "picker::ConfirmInput"
        { secondary = true; }
      ];
      tab = "picker::ConfirmCompletion";
    };
    context = "Picker > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      tab = "channel_modal::ToggleMode";
    };
    context = "ChannelModal > Picker > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd = "file_finder::ToggleMenu";
    };
    context = "FileFinder";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-h = "pane::SplitLeft";
      cmd-j = "pane::SplitDown";
      cmd-k = "pane::SplitUp";
      cmd-l = "pane::SplitRight";
      cmd-shift-p = "file_finder::SelectPrev";
    };
    context = "FileFinder && !menu_open";
    use_key_equivalents = true;
  }
  {
    bindings = {
      h = "pane::SplitLeft";
      j = "pane::SplitDown";
      k = "pane::SplitUp";
      l = "pane::SplitRight";
    };
    context = "FileFinder && menu_open";
    use_key_equivalents = true;
  }
  {
    bindings = {
      ctrl-backspace = "tab_switcher::CloseSelectedItem";
      ctrl-down = "menu::SelectNext";
      ctrl-shift-tab = "menu::SelectPrev";
      ctrl-up = "menu::SelectPrev";
    };
    context = "TabSwitcher";
    use_key_equivalents = true;
  }
  {
    bindings = {
      alt-b = [
        "terminal::SendText"
        "b"
      ];
      alt-f = [
        "terminal::SendText"
        "f"
      ];
      alt-left = [
        "terminal::SendText"
        "b"
      ];
      alt-right = [
        "terminal::SendText"
        "f"
      ];
      cmd-a = "editor::SelectAll";
      cmd-backspace = [
        "terminal::SendText"
        ""
      ];
      cmd-c = "terminal::Copy";
      cmd-down = "terminal::ScrollPageDown";
      cmd-end = "terminal::ScrollToBottom";
      cmd-home = "terminal::ScrollToTop";
      cmd-k = "terminal::Clear";
      cmd-left = [
        "terminal::SendText"
        ""
      ];
      cmd-n = "workspace::NewTerminal";
      cmd-right = [
        "terminal::SendText"
        ""
      ];
      cmd-up = "terminal::ScrollPageUp";
      cmd-v = "terminal::Paste";
      ctrl-c = [
        "terminal::SendKeystroke"
        "ctrl-c"
      ];
      ctrl-cmd-space = "terminal::ShowCharacterPalette";
      ctrl-enter = "assistant::InlineAssist";
      "ctrl-k down" = "pane::SplitDown";
      "ctrl-k left" = "pane::SplitLeft";
      "ctrl-k right" = "pane::SplitRight";
      "ctrl-k up" = "pane::SplitUp";
      ctrl-shift-space = "terminal::ToggleViMode";
      down = [
        "terminal::SendKeystroke"
        "down"
      ];
      enter = [
        "terminal::SendKeystroke"
        "enter"
      ];
      escape = [
        "terminal::SendKeystroke"
        "escape"
      ];
      pagedown = [
        "terminal::SendKeystroke"
        "pagedown"
      ];
      pageup = [
        "terminal::SendKeystroke"
        "pageup"
      ];
      shift-down = "terminal::ScrollLineDown";
      shift-end = "terminal::ScrollToBottom";
      shift-home = "terminal::ScrollToTop";
      shift-pagedown = "terminal::ScrollPageDown";
      shift-pageup = "terminal::ScrollPageUp";
      shift-up = "terminal::ScrollLineUp";
      up = [
        "terminal::SendKeystroke"
        "up"
      ];
    };
    context = "Terminal";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-shift-backspace = "zeta::ThumbsDownActiveCompletion";
      cmd-shift-enter = "zeta::ThumbsUpActiveCompletion";
      right = "zeta::PreviewCompletion";
      shift-down = "zeta::NextEdit";
      shift-up = "zeta::PreviousEdit";
    };
    context = "RateCompletionModal";
    use_key_equivalents = true;
  }
  {
    bindings = {
      cmd-shift-backspace = "zeta::ThumbsDownActiveCompletion";
      cmd-shift-enter = "zeta::ThumbsUpActiveCompletion";
      escape = "zeta::FocusCompletions";
    };
    context = "RateCompletionModal > Editor";
    use_key_equivalents = true;
  }
  {
    bindings = {
      escape = "menu::Cancel";
    };
    context = "ZedPredictModal";
    use_key_equivalents = true;
  }
]
