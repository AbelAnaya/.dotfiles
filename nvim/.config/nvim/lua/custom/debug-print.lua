return {
    "andrewferrier/debugprint.nvim",
    dependencies = {
        "echasnovski/mini.nvim", -- Needed to enable :ToggleCommentDebugPrints for NeoVim <= 0.9
        "nvim-treesitter/nvim-treesitter", -- Needed to enable treesitter for NeoVim 0.8
    },
    -- Remove the following line to use development versions,
    -- not just the formal releases
    version = "*",
    config = function()
        require("debugprint").setup({
            keymaps = {
                normal = {
                    plain_below = "<leader>rp",
                    plain_above = "<leader>rP",
                    variable_below = "<leader>rv",
                    variable_above = "<leader>rV",
                    variable_below_alwaysprompt = "<leader>rc",
                    variable_above_alwaysprompt = "<leader>rC",
                    textobj_below = "<leader>ro",
                    textobj_above = "<leader>rO",
                    toggle_comment_debug_prints = "<leader>rt",
                    delete_debug_prints = "<leader>rd",
                },
                visual = {
                    variable_below = "<leader>rv",
                    variable_above = "<leader>rV",
                },
            },
        })
    end,
}
