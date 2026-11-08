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

  block-sort-nvim = inputs.block-sort-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
        lspkind-nvim # Add vscode-like lspkind indicators to completion menu.
        nvim-lspconfig # LSP config.

        # UI
        aerial-nvim
        bufferline-nvim # I rarely use the buffer line, but makes me feel more comfortable.
        edgy-nvim # Better layout management. I cannot live without this.
        fidget-nvim # TODO: not yet configured.
        glance-nvim # GoTo, References, etc previewer.
        inputs.yume.packages.${pkgs.stdenv.hostPlatform.system}.default # My neovim theme.
        lsp_signature-nvim ## Show lsp_signature while writing.
        lualine-nvim # Status line.
        tiny-inline-diagnostic-nvim # Inline lsp diagnostics.

        # Utils
        actions-preview-nvim # Previewer for code actions.
        block-sort-nvim # Sort blocks of code (flake input, not from nixpkgs)
        conform-nvim # Auto run formatters.
        gitsigns-nvim # Git utils.
        lspsaga-nvim # A bunch of lsp utilities.
        luasnip # Snippet support.
        mini-nvim # A bunch of QoL utilities.
        neo-tree-nvim # File tree.
        nvim-autopairs # Autopairs.
        nvim-lint # Auto run linters.
        nvim-surround # Fast surround keymaps.
        nvim-ts-autotag # Autopairs for html, jsx and tsx tags.
        snacks-nvim
        telescope-fzf-native-nvim # Native fzf implementation for telescope-nvim.
        telescope-nvim # Fuzzy finder.
        toggleterm-nvim # Used for floating term.
        trouble-nvim # Panel for diagnostics.
        vim-fugitive # Useful Git features.
        vimtex # Better latex support.

        # Misc
        SchemaStore-nvim # Get json and yaml schemas from SchemaStore.
        ltex_extra-nvim # Handle LanguageTool code actions.
        nui-nvim # UI library, required by other plugins.
        nvim-treesitter.withAllGrammars # Treesitter grammars.
        nvim-web-devicons # Use Nerdfont icons in UI.
        plenary-nvim # Utility library, required by other plugins.
      ];

      extraPackages = with pkgs; [
        # Language Servers
        basedpyright # Python.
        bash-language-server # Bash.
        gopls # Go.
        harper # Spell checker.
        kdePackages.qtdeclarative # QML.
        ltex-ls-plus # LanguageTool support.
        lua-language-server # Lua.
        nginx-language-server # NGINX configuration files.
        nixd # Nix.
        sqls # SQL language server.
        systemd-lsp # Systemd units.
        tailwindcss-language-server # Tailwind classes.
        taplo # TOML.
        texlab # Latex.
        typescript-language-server # Javascript & Typescript.
        vscode-langservers-extracted # HTML, CSS and others.
        yaml-language-server # YAML.

        # Formatters & Linters

        ## Go
        golangci-lint # Formatter and Linter.

        ## JS & TS.
        eslint_d # Javascript & Typescript Linter.
        prettierd # Javascript & Typescript Formatter.

        ## Latex
        tex-fmt # Latex formatter.
        texlivePackages.chktex

        ## Lua
        selene # Linter.
        stylua # Formatter.

        ## Nix
        alejandra # Formatter
        deadnix # Linter
        statix # Linter

        ## Python
        ruff

        ## Shell.
        shellcheck
        shfmt

        ## YAML.
        yamlfmt

        # Misc
        delta # Required by actions-preview-nvim.
        luajitPackages.jsregexp # Required by luasnip.
        ripgrep # Fast grep.
        zathura # PDF viewer.
      ];

      withNodeJs = true;
      withPython3 = false;
      withRuby = false;
    };

    # Copy dotfiles.
    xdg.configFile."nvim".source = apps.nvim;
  };
}
