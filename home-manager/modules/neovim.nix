{apps, ...}: {
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.custom.programs.neovim;
  my-neovim = pkgs.symlinkJoin {
    inherit (pkgs.neovim-unwrapped) meta passthru lua;

    name = "neovim-unwrapped";
    paths = [pkgs.neovim-unwrapped];
    nativeBuildInputs = [pkgs.makeBinaryWrapper];
    postBuild = ''
      wrapProgram $out/bin/nvim --set NEOVIM_SYSTEM_MANAGED_PLUGINS_PATH "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start"
    '';
  };
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

      package = my-neovim;

      defaultEditor = cfg.defaultEditor;

      viAlias = cfg.viAlias;
      vimAlias = cfg.vimAlias;

      plugins = with pkgs.vimPlugins; [
        # Motion
        leap-nvim

        # Lsp
        blink-cmp
        nvim-lspconfig

        # Utils
        neo-tree-nvim

        # Misc
        nui-nvim
        plenary-nvim
        nvim-web-devicons
      ];

      extraPackages = with pkgs; [
        lua-language-server
        nixd
      ];

      withPython3 = false;
      withRuby = false;
    };

    home.file.".config/nvim".source = apps.nvim;
  };
}
