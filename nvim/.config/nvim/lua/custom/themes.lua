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
            require("onedarkpro").setup()
        end,
    },

    { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { "doums/darcula", lazy = false, priority = 1000 },

    { "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },

    { "maxmx03/dracula.nvim", lazy = false, priority = 1000 },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        -- Theme inspired by Atom
        "navarasu/onedark.nvim",
        priority = 1000,
    },
}
