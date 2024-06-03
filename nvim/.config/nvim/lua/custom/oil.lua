return {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = {
                "permissions",
                "size",
                "icon",
            },
            keymaps = {
                ["<C-p>"] = false,
                ["<M-p>"] = "actions.preview",
            },
            win_options = {
                wrap = false,
                signcolumn = "yes",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            delete_to_trash = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            },
        })
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
}
