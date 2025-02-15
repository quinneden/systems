{ inputs, ... }:
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

      "private_keys/oc-runner" = { };
      "private_keys/picache" = { };
    };
  };
}
