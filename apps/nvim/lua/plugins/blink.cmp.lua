return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = { preset = "enter" },

        sources = {
            providers = {
                buffer = {
                    opts = {
                        get_bufnrs = function()
                            return vim.tbl_filter(function(bufnr)
                                return vim.bo[bufnr].buftype == ''
                            end, vim.api.nvim_list_bufs())
                        end,
                    }
                }
            }
        },

        completion = {
            ghost_text = { enabled = true },
        },
    },
}
