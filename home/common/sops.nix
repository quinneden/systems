{
  inputs,
  pkgs,
  ...
}:
let
  secretsPath = toString inputs.secrets + "/sops";
  homeDirectory = if pkgs.stdenv.isDarwin then "/Users/quinn" else "/home/quinn";
in
{
  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "${homeDirectory}/.ssh/id_ed25519" ];
      keyFile = "${homeDirectory}/.config/sops/key.txt";
      generateKey = true;
    };

    secrets = {
      github_token = { };

      "plain/rclone.ini" = {
        format = "ini";
        sopsFile = "${secretsPath}/plain/rclone.ini";
        path = "${homeDirectory}/.config/rclone/rclone.conf";
      };

      "private_keys/oc-runner" = {
        path = "${homeDirectory}/.ssh/keys/oc-runner";
      };
      "private_keys/picache" = {
        path = "${homeDirectory}/.ssh/keys/picache";
      };
    };
  };
}
