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
      inherit (cfg) defaultEditor viAlias vimAlias;

      enable = true;

      package = my-neovim;

      plugins = with pkgs.vimPlugins; [
        # Motion
        leap-nvim

        # Lsp
        blink-cmp
        nvim-lspconfig

        # UI
        lualine-nvim
        fidget-nvim
        edgy-nvim
        bufferline-nvim
        tiny-inline-diagnostic-nvim
        cyberdream-nvim

        # Utils
        luasnip
        nvim-surround
        nvim-autopairs
        nvim-ts-autotag
        actions-preview-nvim
        telescope-nvim
        telescope-fzf-native-nvim
        lspsaga-nvim
        gitsigns-nvim
        trouble-nvim
        neo-tree-nvim
        vim-fugitive
        toggleterm-nvim
        conform-nvim
        nvim-lint
        mini-nvim

        # Misc
        nvim-treesitter.withAllGrammars
        nui-nvim
        plenary-nvim
        nvim-web-devicons
        bufdelete-nvim
        SchemaStore-nvim
      ];

      extraPackages = with pkgs; [
        # Language Servers
        vscode-json-languageserver
        yaml-language-server
        gopls
        taplo
        lua-language-server
        nixd
        kdePackages.qtdeclarative

        # Formatters & Linters
        stylua # Lua formatter
        selene # Lua linter
        alejandra # Nix formatter
        deadnix # Nix linter
        statix # Nix linter
        golangci-lint # Go formatter and linter

        # Misc
        delta
        luajitPackages.jsregexp
        ripgrep
      ];

      withPython3 = false;
      withRuby = false;
    };

    xdg.configFile."nvim".source = apps.nvim;
  };
}
