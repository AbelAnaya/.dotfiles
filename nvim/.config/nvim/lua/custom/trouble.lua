return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            auto_preview = false,
            auto_fold = true,
            auto_close = true,
            use_diagnostic_signs = true,
        })

        vim.keymap.set(
            "n",
            "<leader>td",
            "<cmd>Trouble diagnostics toggle<CR>",
            { silent = true, desc = "[T]oggle [D]iagnostics [T]oggle" }
        )

        vim.keymap.set(
            "n",
            "<leader>tD",
            "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
            { silent = true, desc = "[T]oggle [D]iagnostics Buffer [T]oggle" }
        )

        vim.keymap.set(
            "n",
            "<leader>tq",
            "<cmd>Trouble loclist toggle<CR>",
            { silent = true, desc = "[T]oggle [L]oclist [T]oggle" }
        )

        vim.keymap.set(
            "n",
            "<leader>tQ",
            "<cmd>Trouble qflist toggle<CR>",
            { silent = true, desc = "[T]oggle [Q]flist [T]oggle" }
        )

        vim.keymap.set(
            "n",
            "<leader>ts",
            "<cmd>Trouble symbols toggle<CR>",
            { silent = true, desc = "[T]oggle [S]ymbols [T]oggle" }
        )

        vim.keymap.set(
            "n",
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
            { silent = true, desc = "[T]oggle [L]sp [T]oggle" }
        )

        vim.keymap.set("n", "<leader>tn", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end, { silent = true, desc = "[T]rouble [N]ext" })

        vim.keymap.set("n", "<leader>tp", function()
            require("trouble").prev({ skip_groups = true, jump = true })
        end, { silent = true, desc = "[T]rouble [P]revious" })
    end,
}
