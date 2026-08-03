{
  apps,
  inputs,
  ...
}: {
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.custom.programs.neovim;

  # Custom neovim package that allow plugins to be managed by Lazy.nvim but installed by nix,
  # this way is more portable and I can easily reuse my neovim config in other distros.
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

      package = my-neovim; # Use custom neovim package defined above.

      plugins = with pkgs.vimPlugins; [
        # Motion
        leap-nvim # My favorite motion plugin.

        # Lsp
        blink-cmp # Completion.
        nvim-lspconfig # LSP config.
        lspkind-nvim # Add vscode-like lspkind indicators to completion menu.

        # UI
        aerial-nvim
        glance-nvim # GoTo, References, etc previewer.
        lualine-nvim # Status line.
        fidget-nvim # TODO: not yet configured.
        edgy-nvim # Better layout management. I cannot live without this.
        bufferline-nvim # I rarely use the buffer line, but makes me feel more comfortable.
        lsp_signature-nvim ## Show lsp_signature while writing.
        tiny-inline-diagnostic-nvim # Inline lsp diagnostics.
        inputs.yume.packages.${pkgs.stdenv.hostPlatform.system}.default # My neovim theme.

        # Utils
        luasnip # Snippet support.
        nvim-surround # Fast surround keymaps.
        nvim-autopairs # Autopairs.
        nvim-ts-autotag # Autopairs for html, jsx and tsx tags.
        actions-preview-nvim # Previewer for code actions.
        telescope-nvim # Fuzzy finder.
        telescope-fzf-native-nvim # Native fzf implementation for telescope-nvim.
        lspsaga-nvim # A bunch of lsp utilities.
        gitsigns-nvim # Git utils.
        trouble-nvim # Panel for diagnostics.
        neo-tree-nvim # File tree.
        vim-fugitive # Useful Git features.
        toggleterm-nvim # Used for floating term.
        conform-nvim # Auto run formatters.
        nvim-lint # Auto run linters.
        mini-nvim # A bunch of QoL utilities.

        # Misc
        nvim-treesitter.withAllGrammars # Treesitter grammars.
        nui-nvim # UI library, required by other plugins.
        plenary-nvim # Utility library, required by other plugins.
        nvim-web-devicons # Use Nerdfont icons in UI.
        bufdelete-nvim # Delete buffer without mess window layout.
        SchemaStore-nvim # Get json and yaml schemas from SchemaStore.
      ];

      extraPackages = with pkgs; [
        # Language Servers
        bash-language-server # Bash.
        nixd # Nix.
        typescript-language-server # Javascript & Typescript.
        gopls # Go.
        lua-language-server # Lua.
        kdePackages.qtdeclarative # QML.
        tailwindcss-language-server # Tailwind classes.
        taplo # TOML.
        vscode-langservers-extracted # HTML, CSS and others.
        yaml-language-server # YAML.
        harper # Spell checker.
        python3Packages.python-lsp-server # Python.
        systemd-lsp # Systemd units.

        # Formatters & Linters

        ## Shell.
        shfmt
        shellcheck

        ## Nix
        alejandra # Formatter
        deadnix # Linter
        statix # Linter

        ## JS & TS.
        eslint_d # Javascript & Typescript Linter.
        prettierd # Javascript & Typescript Formatter.

        ## Go
        golangci-lint # Formatter and Linter.

        ## Lua
        selene # Linter.
        stylua # Formatter.

        ## Python
        ruff

        ## YAML.
        yamlfmt

        # Misc
        delta # Required by actions-preview-nvim.
        luajitPackages.jsregexp # Required by luasnip.
        ripgrep # Fast grep.
      ];

      withNodeJs = true;
      withPython3 = false;
      withRuby = false;
    };

    # Copy dotfiles.
    xdg.configFile."nvim".source = apps.nvim;
  };
}
