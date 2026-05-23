{apps, ...}: {
  pkgs,
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

      package = pkgs.neovim-unwrapped.overrideAttrs (oldAttrs: {
        nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [pkgs.makeBinaryWrapper];

        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            wrapProgram $out/bin/nvim --set NEOVIM_SYSTEM_MANAGED_PLUGINS_PATH "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start"
          '';
      });

      defaultEditor = cfg.defaultEditor;

      viAlias = cfg.viAlias;
      vimAlias = cfg.vimAlias;

      plugins = with pkgs.vimPlugins; [
        leap-nvim
      ];
    };

    home.file.".config/nvim".source = apps.nvim;
  };
}
