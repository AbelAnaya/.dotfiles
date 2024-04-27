return {
    'tpope/vim-fugitive',
    config =  function ()

        -- Fugitive remaps (Git integration)
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        -- Conflict solving
        vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")

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
                local opts = {buffer = bufnr, remap = false}

                -- Push
                vim.keymap.set("n", "<leader>p", "<cmd>Git push<CR>", opts)

                -- rebase always
                vim.keymap.set("n", "<leader>P", "<cmd>Git pull --rebase<CR>", opts);

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })

    end
}
