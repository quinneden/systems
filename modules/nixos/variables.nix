{ lib, ... }:

with lib;
{
  options = {
    var = mkOption {
      type = types.attrs;
      default = { };
    };
  };
}
