_: {
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.custom.registries.templates.enable = mkEnableOption "enable templates registry";

  config = mkIf config.custom.registries.templates.enable {
    nix.registry.templates = {
      exact = true;
      from = {
        type = "indirect";
        id = "templates";
      };
      to = {
        type = "github";
        owner = "kytnacode";
        repo = "templates";
      };
    };
  };
}
