return {
    "tpope/vim-fugitive",
    config = function()
        -- Fugitive remaps (Git integration)
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [s]tatus" })

        -- Conflict solving
        vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "[G]it get left diff [h]" })
        vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "[G]it get right diff [l]" })

        local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()

                -- Push
                vim.keymap.set(
                    "n",
                    "<leader>p",
                    "<cmd>Git push<CR>",
                    { desc = "Git [p]ush", buffer = bufnr, remap = false }
                )

                -- rebase always
                vim.keymap.set(
                    "n",
                    "<leader>P",
                    "<cmd>Git pull --rebase<CR>",
                    { desc = "Git [P]ull", buffer = bufnr, remap = false }
                )

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set(
                    "n",
                    "<leader>t",
                    ":Git push -u origin ",
                    { desc = "Git push [t]rack branch", buffer = bufnr, remap = false }
                )
            end,
        })
    end,
}
