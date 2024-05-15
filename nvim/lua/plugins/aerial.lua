return {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        require("aerial").setup({
            layout = {
                -- These control the width of the aerial window.
                -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_width and max_width can be a list of mixed types.
                -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
                max_width = { 25, 0.2 },
                width = nil,
                min_width = 25,

                -- key-value pairs of window-local options for aerial window (e.g. winhl)
                win_opts = {},

                -- Determines the default direction to open the aerial window. The 'prefer'
                -- options will open the window in the other direction *if* there is a
                -- different buffer in the way of the preferred direction
                -- Enum: prefer_right, prefer_left, right, left, float
                default_direction = "prefer_right",

                -- Determines where the aerial window will be opened
                --   edge   - open aerial at the far right/left of the editor
                --   window - open aerial to the right/left of the current window
                placement = "window",

                -- When the symbols change, resize the aerial window (within min/max constraints) to fit
                resize_to_content = true,

                -- Preserve window size equality with (:help CTRL-W_=)
                preserve_equality = true,
            },

            -- Determines how the aerial window decides which buffer to display symbols for
            --   window - aerial window will display symbols for the buffer in the window from which it was opened
            --   global - aerial window will display symbols for the current window
            attach_mode = "window",

            -- Determines line highlighting mode when multiple splits are visible.
            -- split_width   Each open window will have its cursor location marked in the
            --               aerial buffer. Each line will only be partially highlighted
            --               to indicate which window is at that location.
            -- full_width    Each open window will have its cursor location marked as a
            --               full-width highlight in the aerial buffer.
            -- last          Only the most-recently focused window will have its location
            --               marked in the aerial buffer.
            -- none          Do not show the cursor locations in the aerial window.
            highlight_mode = "split_width",

            -- Highlight the closest symbol if the cursor is not exactly on one.
            highlight_closest = true,

            -- Highlight the symbol in the source buffer when cursor is in the aerial win
            highlight_on_hover = true,

            -- When jumping to a symbol, highlight the line for this many ms.
            -- Set to false to disable
            highlight_on_jump = 300,

            open_automatic = true,
            -- Run this command after jumping to a symbol (false will disable)
            post_jump_cmd = "normal! zz",

            show_guides = true,

            -- Customize the characters used when show_guides = true
            guides = {
                -- When the child item has a sibling below it
                mid_item = "├─ ",
                -- When the child item is the last in the list
                last_item = "└─ ",
                -- When there are nested child guides to the right
                nested_top = "│  ",
                -- Raw indentation
                whitespace = "  ",
            },

        })

        vim.cmd([[ hi AerialLine guifg=#e2be7d guibg=#3a404c ]])
        vim.cmd([[ hi AerialGuide guifg=#5c6370 ]])

    end,
}
