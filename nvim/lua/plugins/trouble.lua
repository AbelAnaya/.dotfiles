return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup {
            auto_preview = false,
            auto_fold = true,
            auto_close = true,
            use_diagnostic_signs = true,
        }

        vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle<CR>", { silent = true, desc = "Toggle [T]rouble" })
    end,

}
