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

        vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { silent = true, desc = "[T]oggle [T]rouble" })

        vim.keymap.set("n", "<leader>tn", function ()
            require("trouble").next({ skip_groups = true, jump = true })
        end, { silent = true, desc = "[T]rouble [N]ext" })

        vim.keymap.set("n", "<leader>tp", function ()
            require("trouble").previous({ skip_groups = true, jump = true })
        end, { silent = true, desc = "[T]rouble [P]revious" })
    end,

}
