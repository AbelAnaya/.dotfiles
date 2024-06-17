return {
    "nvim-focus/focus.nvim",
    config = function()
        require("focus").setup({
            enable = true, -- Enable module
            commands = true, -- Create Focus commands
            autoresize = {
                enable = true, -- Enable or disable auto-resizing of splits
                width = 0, -- Force width for the focused window
                height = 0, -- Force height for the focused window
                minwidth = 0, -- Force minimum width for the unfocused window
                minheight = 0, -- Force minimum height for the unfocused window
                height_quickfix = 10, -- Set the height of quickfix panel
            },
            split = {
                bufnew = false, -- Create blank buffer for new split windows
                tmux = false, -- Create tmux splits instead of neovim splits
            },
            ui = {
                number = false, -- Display line numbers in the focussed window only

                cursorline = false, -- Display a cursorline in the focussed window only
                cursorcolumn = false, -- Display cursorcolumn in the focussed window only
                colorcolumn = {
                    enable = false, -- Display colorcolumn in the foccused window only
                },
                signcolumn = false, -- Display signcolumn in the focussed window only
                winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
            },
        })
    end,
}
