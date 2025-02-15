{ inputs, ... }:
{
  programs.git = {
    enable = true;
    signing.format = "ssh";
    extraConfig = {
      color.ui = true;
      core.editor = "micro";
      credential.helper = "store";
      github.user = "quinneden";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      url = {
        "https://oauth2:${inputs.secrets.git.token}@github.com".insteadOf = "https://github.com";
      };
    };
    userEmail = "quinnyxboy@gmail.com";
    userName = "Quinn Edenfield";
  };
}
