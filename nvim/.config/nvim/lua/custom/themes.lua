return {

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("onedarkpro").setup({
                colors = {
                    cursorline = "require('onedarkpro.helpers').darken('gray', 18, 'onedark_vivid')",
                    color_column = "require('onedarkpro.helpers').darken('gray', 18, 'onedark_vivid')",
                },
                options = {
                    cursorline = true,
                    lualine_transparency = true,
                    highlight_inactive_windows = true,
                },
                highlights = {
                    NonText = { bg = "NONE", fg = "gray" },
                },
            })
        end,
    },

    { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                transparent_background = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    mason = true,
                    noice = true,
                    notify = true,
                    telescope = true,
                    mini = true,
                    lsp_trouble = true,
                },
            })
        end,
    },

    { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

    { "doums/darcula", lazy = false, priority = 1000 },

    { "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },

    { "maxmx03/dracula.nvim", lazy = false, priority = 1000 },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
}
