{ lib, ... }:
{
  theme = rec {
    rounding = 12;
    gaps-in = 4;
    gaps-out = gaps-in * 1.5;
    active-opacity = 1;
    inactive-opacity = 0.88;
    blur = true;
    border-size = 1;
    animation-speed = "medium"; # "fast" | "medium" | "slow"
    fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
    bar = {
      position = "top";
      transparent = true;
      transparentButtons = false;
      floating = true;
    };
  };

  var = rec {
    hostname = "nixos-macmini";
    username = "quinn";
    homeDirectory = lib.path.append /home username;
    configDirectory = lib.path.append homeDirectory ".dotfiles";

    keyboardLayout = "us";

    location = "Portland";
    timeZone = "America/Los_Angeles";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "quinneden";
      email = "quinnyxboy@gmail.com";
    };

    autoGarbageCollector = true;
  };
}
