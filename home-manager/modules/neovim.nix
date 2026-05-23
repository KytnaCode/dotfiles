{apps, ...}: {
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.custom.programs.neovim;
in {
  options.custom.programs.neovim = {
    enable = mkEnableOption "use dotfiles' neovim configuration";
    defaultEditor = mkEnableOption "set neovim to default editor";
    viAlias = mkOption {
      type = types.bool;
      default = cfg.defaultEditor;
      defaultText = "custom.programs.neovim.defaultEditor";
    };
    vimAlias = mkOption {
      type = types.bool;
      default = cfg.defaultEditor;
      defaultText = "custom.programs.neovim.defaultEditor";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = cfg.defaultEditor;

      viAlias = cfg.viAlias;
      vimAlias = cfg.vimAlias;
    };

    home.file.".config/nvim".source = apps.nvim;
  };
}
