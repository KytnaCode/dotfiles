local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- disable netrw at the very start for custom file explorer usage
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Add Plugins --
require("lazy").setup({
  -- UI
  "j-hui/fidget.nvim",
  "dnlhc/glance.nvim",
  "stevearc/dressing.nvim",
  {
    "yamatsum/nvim-cursorline",
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = true,
          timeout = 0,
          number = true,
        },
        cursorword = {
          enable = true,
          min_lenght = 3,
          hl = { underline = true },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {},
  },
  "ray-x/navigator.lua",
  "nvim-lualine/lualine.nvim",
  "danilamihailov/beacon.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-latte")
      require("catppuccin").setup({
        integrations = {
          aerial = true,
          alpha = true,
          beacon = true,
          fidget = true,
          gitsigns = true,
          indent_blankline = {
            enabled = true,
            scope_color = "pink", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
          leap = true,
          lsp_saga = true,
          mason = true,
          cmp = true,
          dap = true,
          dap_ui = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          treesitter = true,
          telescope = {
            enabled = true,
            -- style = "nvchad"
          },
          lsp_trouble = true,
        },
      })
    end,
  },
  {
    "linrongbin16/lsp-progress.nvim",
    config = function() -- setup on load
      require("lsp-progress").setup({})
    end,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Config Util
  {
    "folke/neodev.nvim",
    opts = {
      library = {
        plugins = { "plenary.nvim", "formatter.nvim" },
      },
    },
    priority = 900,
    --config = function()
    --  require("neodev").setup({
    --override = function(root_dir, library)
    --  if root_dir:find(vim.fn.expand("~/.local/share/nvim/lazy"), 1, true) == 1 then
    --    library.enabled = true
    --    library.plugins = { "plenary.nvim" }
    --  end
    --end,
    --  })
    --end,
  },

  -- Editor
  "b0o/schemastore.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua" },
        auto_install = true,

        highlight = {
          enable = true,
        },
      })
    end,
  },
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "ActivityWatch/aw-watcher-vim",
  "andweeb/presence.nvim",
  "famiu/bufdelete.nvim",
  { "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim" },
  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        autoload = true,
        autosave = true,
        should_autosave = function()
          print(vim.bo.filetype)
          if vim.bo.filetype == "alpha" then
            return false
          end
          if vim.bo.filetype == "NvimTree" then
            return false
          end
          if vim.bo.filetype == "Trouble" then
            return false
          end
          return true
        end,
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
      })
    end,
  },
  {
    "ggandor/leap.nvim",
  }, -- a super fast motion plugin
  {
    "sitiom/nvim-numbertoggle",
    config = function()
      vim.o.number = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<C-space>", require("actions-preview").code_actions)
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
    dependencies = {
      --'nvim-treesitter/nvim-treesitter' -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk)
          map("n", "<leader>hr", gs.reset_hunk)
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },
  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  -- Language Server Protocol (LSP), DAP (Debuger Adapter Protocol), Linters, Formatters and autocompletion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  {
    "leoluz/nvim-dap-go", -- configure easily go's DAP
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })

      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }, -- install Language Servers (ls), DA (Debuger Adapters), linters and formatters seamlessly
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  "neovim/nvim-lspconfig",
  "RishabhRD/nvim-lsputils",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-lint",
  "mhartington/formatter.nvim",

  "nvim-lua/plenary.nvim", -- TODO: mark this as a telescope dependency
}, {})

--- Telescope extensions
require("telescope").load_extension("projects")
require("telescope").load_extension("persisted")

--- Keymaps ---

-- Vim Keymaps
vim.keymap.set("n", "d", '"_d') -- now delete doesn't put text in t he clipboard, this is true in all maps that use d, d$, dd, dl, etc

-- File Keymaps
local genghis = require("genghis")
vim.keymap.set("n", "<leader>yp", genghis.copyFilepath)
vim.keymap.set("n", "<leader>yn", genghis.copyFilename)
vim.keymap.set("n", "<leader>cx", genghis.chmodx)
vim.keymap.set("n", "<leader>rf", genghis.renameFile)
vim.keymap.set("n", "<leader>mf", genghis.moveAndRenameFile)
vim.keymap.set("n", "<leader>mc", genghis.moveToFolderInCwd)
vim.keymap.set("n", "<leader>nf", genghis.createNewFile)
vim.keymap.set("n", "<leader>yf", genghis.duplicateFile)
vim.keymap.set("n", "<leader>df", genghis.trashFile)
vim.keymap.set("x", "<leader>x", genghis.moveSelectionToNewFile)

-- Nvim Tree Keymaps
local tree_api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>tt", tree_api.tree.toggle, {})
vim.keymap.set("n", "<leader>to", tree_api.tree.open, {})
vim.keymap.set("n", "<leader>tc", tree_api.tree.close, {})

-- Buffer keymaps
vim.keymap.set("n", "bn", "<CMD>bnext<CR>")
vim.keymap.set("n", "bp", "<CMD>bprevious<CR>")
vim.keymap.set("n", "bd", "<CMD>Bdelete<CR>") -- use Bdelete provided by bufdelete.nvim instead of built-in bdelete to avoid losing window layout

-- Telescope keymaps --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fp", require("telescope").extensions.projects.projects, {})

-- Glance Keymaps
vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")

-- Trouble keymaps
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gR", function()
  require("trouble").toggle("lsp_references")
end)

-- Aerial keymaps
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- LSP Keymaps

-- Lua line --
require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = {
      -- invoke `progress` here.
      require("lsp-progress").progress,
    },
  },
  options = {
    theme = "catppuccin-latte", -- set lualine theme, commonly the same set in catppucin theme config
  },
  extensions = { "aerial", "lazy", "mason", "nvim-dap-ui", "trouble" },
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

-- Get highlight group
local function h(name)
  return vim.api.nvim_get_hl(0, { name = name })
end

-- hl-groups can have any name
vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("StatusLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("StatusLine").bg, fg = h("Comment").fg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("StatusLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("StatusLine").bg, italic = true })
vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("StatusLine").bg, italic = true })

-- Set symbolusage format
-- symbol usage is the plugin that show how many usages has a symbol (function, var, etc) upon it
local function text_format(symbol)
  local res = {}

  local round_start = { "", "SymbolUsageRounding" }
  local round_end = { "", "SymbolUsageRounding" }

  if symbol.references then
    local usage = symbol.references <= 1 and "usage" or "usages"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(res, round_start)
    table.insert(res, { "󰌹 ", "SymbolUsageRef" })
    table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.definition then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰳽 ", "SymbolUsageDef" })
    table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  if symbol.implementation then
    if #res > 0 then
      table.insert(res, { " ", "NonText" })
    end
    table.insert(res, round_start)
    table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
    table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
    table.insert(res, round_end)
  end

  return res
end

-- Setup symbolusage
require("symbol-usage").setup({
  text_format = text_format,
})

-- Setup Linters
require("lint").linters_by_ft = {
  lua = { "selene" },
  go = { "golangcilint" },
  vim = { "vint" },
}

-- configure nvim-linter
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Configure nvim-formatter
require("formatter").setup({
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    go = {
      require("formatter.filetypes.go").gofmt(),
      require("formatter.filetypes.go").golines(),
      require("formatter.filetypes.go").goimports(),
    },
  },
})

-- Format on save
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

--- Options
-- For filetype-specific configuration create a file named ftplugin/<file-type>.lua and set options there
local o = vim.o

-- set indentation options
o.expandtab = true -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2 -- num of space characters per tab
o.shiftwidth = 2 -- spaces per indentation level

-- set sessions options
o.sessionoptions = "buffers,curdir,tabpages,winsize"

-- vim options
o.clipboard = "unnamedplus"

--- setup cmp ---
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- { name = "vsnip" }, -- For vsnip users.
    { name = "luasnip" }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = "buffer" },
  }),
  formatting = {

    expandable_indicator = true,
    fields = { "menu", "abbr", "kind" },
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 70,
      ellipsis_char = "...",
      show_labelDetails = true,
      before = function(_, vim_item)
        -- Add a space after variable kind as a right margin,
        -- yes, it's not the most elegant way to do it, but it works
        if vim_item.kind then
          vim_item.kind = vim_item.kind .. " "
        end

        return vim_item
      end,
    }),
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Set up lspconfig.
require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP) Configuration

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

require("lspconfig").jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(), -- use SchemaStore to get autocompletion in a wide set of .json files
      validate = { enable = true },
    },
  },
})

require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(), -- use SchemaStore to get autocompletion in a wide set of .yaml/.yml files
    },
  },
})

-- Go Languae Server (LS) (LSP)
require("lspconfig").gopls.setup({})

-- Vimscript Language Server (LS) (LSP)
require("lspconfig").vimls.setup({})

--- Debuger Adapter Protocol (DAP) Configuration
require("dap-go").setup({})

local colors = require("catppuccin.palettes").get_palette("latte")

vim.api.nvim_set_hl(0, "Beacon", { bg = colors.blue })

require("leap").create_default_mappings()

local function windowGoTo()
  local picked_window_id = require("window-picker").pick_window()
  if type(picked_window_id) == "number" then
    vim.api.nvim_set_current_win(picked_window_id)
  end
end

vim.keymap.set("n", "<leader>sw", windowGoTo)
