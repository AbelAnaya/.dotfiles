return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    tag = "v2.20.8",
    config = function()

        -- Create vim highlight color light gray
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FFFFFF gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent2 guifg=#505050 gui=nocombine]]

        require("indent_blankline").setup{
            space_char_blankline = ' ',
            show_end_of_line = true,
            filetype = { "python" },

            char_highlight_list = {
                "IndentBlanklineIndent1",
            },

            space_char_highlight_list = {
                "IndentBlanklineIndent2",
            },

        }
    end,
}
