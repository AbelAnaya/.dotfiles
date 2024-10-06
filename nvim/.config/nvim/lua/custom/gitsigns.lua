return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },

        current_line_blame = true,
        current_line_blame_formatter = "    <author>, <author_time:%d/%m/%Y> - <summary>",
        current_line_blame_opts = {
            relative_time = true,
            virt_text = true,
            virt_text_pos = "eol",
            delay = 500,
        },

        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
            vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
            vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc = "[H]unk [P]review" })
            vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { buffer = bufnr, desc = "[G]it [D]iff this" })

            vim.keymap.set("n", "<leader>gD", function()
                gitsigns.diffthis("@")
            end, { buffer = bufnr, desc = "[G]it [D]iff against previous commit" })

            vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { buffer = bufnr, desc = "[G]it [B]lame line" })

            vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "[H]unk [s]tage" })
            vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "[H]unk [r]eset" })
            vim.keymap.set("v", "<leader>hs", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { buffer = bufnr, desc = "[H]unk [s]tage" })
            vim.keymap.set("v", "<leader>hr", function()
                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { buffer = bufnr, desc = "[H]unk [r]eset" })

            vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { buffer = bufnr, desc = "[H]unk [S]tage" })
            vim.keymap.set(
                "n",
                "<leader>hu",
                gitsigns.undo_stage_hunk,
                { buffer = bufnr, desc = "[H]unk [u]undo stage" }
            )
            vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { buffer = bufnr, desc = "[H]unk [R]eset" })
            vim.keymap.set(
                "n",
                "<leader>hd",
                gitsigns.toggle_deleted,
                { buffer = bufnr, desc = "[H]unk toggle [d]elete" }
            )
        end,
    },
}
