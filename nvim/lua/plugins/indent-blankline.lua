return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    tag = "v2.20.8",
    opts = {
      space_char_blankline = ' ',
      show_end_of_line = true,
      filetype = { "python" },
    }
}
