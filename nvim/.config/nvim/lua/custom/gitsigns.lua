return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '│' },
            change = { text = '│' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },

        current_line_blame = true,
        current_line_blame_formatter = '    <author>, <author_time:%d/%m/%Y> - <summary>',
        current_line_blame_formatter_opts = {
            relative_time = true,
            virt_text = true,
            virt_text_pos = 'eol',
            delay = 500,
        },

        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')
            vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
            vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
            vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
            vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { buffer = bufnr, desc = '[G]it [D]iff this' })

            vim.keymap.set('n', '<leader>gD', function()
                gitsigns.diffthis '@'
            end, { buffer = bufnr, desc = '[G]it [D]iff against previous commit' })

            vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { buffer = bufnr, desc = '[G]it [B]lame line' })

        end,
    },
}
