{
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = (lib.custom.scanPaths ./.) ++ [
    ../common
    inputs.mac-app-util.darwinModules.default
    # inputs.lix-module.nixosModules.default
  ];

  users.users.quinn = {
    description = "Quinn Edenfield";
    home = "/Users/quinn";
    shell = pkgs.zsh;
  };

  nix.daemonProcessType = "Adaptive";

  nixpkgs.overlays = [
    inputs.nh.overlays.default
    self.overlays.darwin
  ];

  system = {
    activationScripts = {
      postActivation.text = ''
        unlink /etc/hosts
        mv /etc/hosts.before-nix-darwin /etc/hosts
      '';

      postUserActivation.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.4;
        autohide-time-modifier = 0.7;
        mineffect = "suck";
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
        ShowStatusBar = false;
      };

      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false; # enable press and hold
        InitialKeyRepeat = 12; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 3; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false; # disable auto capitalization
        NSAutomaticDashSubstitutionEnabled = false; # disable auto dash substitution
        NSAutomaticPeriodSubstitutionEnabled = false; # disable auto period substitution
        NSAutomaticQuoteSubstitutionEnabled = false; # disable auto quote substitution
        NSAutomaticSpellingCorrectionEnabled = false; # disable auto spelling correction
        NSNavPanelExpandedStateForSaveMode = true; # expand save panel by default
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      CustomUserPreferences = {
        ".GlobalPreferences" = {
          AppleSpacesSwitchOnActivate = true;
        };

        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
          AppleFontSmoothing = 2;
        };

        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };

        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0;
          StandardHideDesktopIcons = 0;
          HideDesktop = 0;
          StageManagerHideWidgets = 1;
          StandardHideWidgets = 0;
        };

        "com.apple.screensaver" = {
          askForPassword = 1;
          askForPasswordDelay = 15; # seconds
        };

        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };

        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };

        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
      };

      loginwindow = {
        GuestEnabled = false; # disable guest user
        SHOWFULLNAME = false; # show full name in login window
        DisableConsoleAccess = false;
      };
      trackpad = {
        ActuationStrength = 0;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    stateVersion = 5;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
