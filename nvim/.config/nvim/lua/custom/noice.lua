return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 20,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 23,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            routes = {
                -- Route written file message to mini (small right down corner notification)
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    view = "mini",
                },
                -- Route undo and replace messages to mini
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "change",
                    },
                    view = "mini",
                },
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "line",
                    },
                    view = "mini",
                },
                -- Hide search count virtual text
                {
                    filter = {
                        event = "msg_show",
                        kind = "search_count",
                    },
                    view = "notify",
                    opts = {
                        title = "Search Count",
                        replace = true,
                    },
                },
            },
        })
    end,
}
