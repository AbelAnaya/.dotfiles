return {
    "echasnovski/mini.nvim",
    config = function()
        -- Better Around/Inside textobjects. Adds next concept with n
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup({ n_lines = 500 })

        -- Highlight trailing whitespaces and newlines. Adds functionality to trim both:
        -- - MiniTrailspace.trim()
        -- - MiniTrailspace.trim_last_lines()
        require("mini.trailspace").setup()

        -- Add indentation scope guideline of current indentation level where cursor is positioned
        require("mini.indentscope").setup({
            draw = {
                animation = function()
                    return 0
                end,
            },
            symbol = "│",
            options = {
                try_as_border = true,
            },
        })

        -- Improve f and t commands by allowing to jump also between lines
        require("mini.jump").setup()

        -- Add 2D jump motions. Enables moving cursor interactively based in encoded chars. Enter 2D jump mode by
        -- pressing <CR>
        require("mini.jump2d").setup({
            labels = "abcdefghijklopqrstuvwxyz",
        })

        -- Remap jump2d highlighting. I enjoyed these two. Pink is less intrusive imo
        vim.cmd([[ hi MiniJump2dSpot guibg=None guifg=#ff007c ]])
        -- vim.cmd([[ hi MiniJump2dSpot guibg=None guifg=#03dfff ]])

        -- Add move of objects visually selected in visual mode. Move with Shift + <h,j,k,l>
        require("mini.move").setup({
            mappings = {
                -- Move visual selection in Visual mode. <Shift> + hjkl.
                left = "H",
                right = "L",
                down = "J",
                up = "K",

                -- Move current line in Normal mode. Default <Alt> + hjkl.
                line_left = "<M-h>",
                line_right = "<M-l>",
                line_down = "<M-j>",
                line_up = "<M-k>",
            },

            options = {
                reindent_linewise = true,
            },
        })
    end,
}
