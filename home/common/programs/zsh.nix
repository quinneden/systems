# {
#   lib,
#   pkgs,
#   config,
#   ...
# }:
# let
#   inherit (pkgs.stdenv) isDarwin;

#   commonAliases = {
#     cddf = "cd $dotdir";
#     cddl = "cd ~/Downloads";
#     gst = "git status";
#     gsur = "git submodule update --init --recursive";
#     l = "eza -la --group-directories-first";
#     ll = "eza -glAh --octal-permissions --group-directories-first";
#     ls = "eza -A";
#     push = "git push";
#     zed = "zeditor";
#   };

#   darwinAliases = {
#     lc = "limactl";
#     reboot = "sudo reboot";
#     sed = "gsed";
#     shutdown = "sudo shutdown -h now";
#     darwin-man = "man configuration.nix";
#   };

#   linuxAliases = {
#     bs = "stat -c%s";
#     code = "codium";
#     db = "distrobox";
#     tree = "eza -ATL3 --git-ignore";
#   };

#   darwinVariables = {
#     PATH = "/run/current-system/sw/bin:/etc/profiles/per-user/quinn/bin:/Users/quinn/.local/bin:\${PATH:+$PATH}";
#     TMPDIR = "/tmp";
#     PAGER = "less";
#     LESS = "-RF";
#   };

#   linuxVariables = {
#     NIXOS_CONFIG = "$HOME/.dotfiles";
#     NH_FLAKE = "$HOME/.dotfiles";
#   };

#   initExtraDarwin = ''[[ $PATH =~ '/nix/store' ]] || eval $(/opt/homebrew/bin/brew shellenv)'';
# in
# with lib;
# {
#   programs.zsh = {
#     enable = true;
#     pure-prompt.enable = true;
#     dotDir = ".config/zsh";
#     shellAliases = commonAliases // (if isDarwin then darwinAliases else linuxAliases);
#     enableCompletion = true;
#     autosuggestion.enable = true;
#     syntaxHighlighting.enable = true;
#     history.path = "${config.xdg.configHome}/zsh/.zsh_history";

#     oh-my-zsh = {
#       enable = true;
#       plugins = [
#         "colored-man-pages"
#         "direnv"
#         "eza"
#         "fzf"
#         "${optionalString isDarwin "iterm2"}"
#         "zoxide"
#       ];
#       custom = "${config.xdg.configHome}/zsh";
#     };

#     initExtraBeforeCompInit =
#       ''
#         fpath+=(
#           "${pkgs.lix}/share/zsh/site-functions"
#           "/etc/profiles/per-user/quinn/share/zsh/site-functions"
#           "${config.xdg.configHome}/zsh/completions"
#         )
#       ''
#       + (optionalString isDarwin ''
#         fpath+=(
#           "/opt/homebrew/share/zsh/site-functions"
#           "/opt/vagrant/embedded/gems/gems/vagrant-2.4.3/contrib/zsh $fpath"
#         )
#       '');

#     initExtra =
#       ''
#         for f ($HOME/.config/zsh/functions/*(N.)); do source $f; done
#       ''
#       + (optionalString isDarwin initExtraDarwin);

#     sessionVariables = {
#       dotdir = "$HOME/.dotfiles";
#       EDITOR = "micro";
#       LANG = "en_US.UTF-8";
#       LC_ALL = "en_US.UTF-8";
#       MICRO_TRUECOLOR = "1";
#     } // (if isDarwin then darwinVariables else linuxVariables);
#   };

#   programs.bash = {
#     enable = true;
#     enableCompletion = true;
#     shellAliases = commonAliases // (if isDarwin then darwinAliases else linuxAliases);
#     bashrcExtra = ''
#       PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\] \$ "
#       HISTCONTROL=ignoredups:erasedups
#       shopt -s histappend
#       PROMPT_COMMAND='history -a; history -n'
#       bind '"\e[A": history-search-backward' # Search history with Up arrow
#       bind '"\e[B": history-search-forward'  # Search history with Down arrow
#     '';
#   };
# }
{ }
