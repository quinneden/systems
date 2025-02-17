{ config, inputs, ... }:
let
  secretsPath = toString inputs.secrets;
in
{
  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      github_token = { };

      "passwords/quinn" = { };
      "passwords/root" = { };

      "plain/rclone.ini" = {
        format = "ini";
        sopsFile = "${secretsPath}/plain/rclone.ini";
        path = "~/.config/rclone/rclone.conf";
      };

      "private_keys/oc-runner" = { };
      "private_keys/picache" = { };

      "private_host_keys/macmini-m1" = {
        path = "/etc/ssh/ssh_host_ed25519_key";
      };

      "private_host_keys/macmini-m4" = {
        path = "/etc/ssh/ssh_host_ed25519_key";
      };
    };
  };
}
