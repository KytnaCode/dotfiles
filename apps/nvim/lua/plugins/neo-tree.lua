return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                      -- neo-tree will lazily load itself
    opts = {
        close_if_last_window = true,
        popup_border_style = "",
        clipboard = {
            sync = "universal", -- or "global"/"universal" to share a clipboard for each/all Neovim instance(s), respectively
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },
            use_libuv_file_watcher = true,
        }
    },
}
