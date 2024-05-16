-- [[ Setting options ]]
-- See `:help vim.o`

-- Set Ruler, TextWidth and indentation configuration
vim.opt.textwidth = 119
vim.opt.colorcolumn = { 120 }

-- Disable show mode below lualine as it is already shown in lualine
vim.opt.showmode = false

-- Set breakline
vim.opt.breakindent = true

-- Disable wrapping
vim.opt.wrap = false

-- Set relative number
vim.opt.nu = true
vim.opt.rnu = true

-- Append completion messages to shortmess to avoid having to hit-enter
vim.opt.shortmess:append("c")

-- Set EOL, Whitespace, Trailing, Whitespace
vim.opt.listchars:append({
	eol = "↵",
	lead = "·",
	trail = "·",
	space = "·",
	tab = "→ ",
	precedes = "<",
	extends = ">",
})
vim.opt.list = true

-- Configure tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Configure vim smart indent
vim.opt.smartindent = true

-- Set highlight on search. Useful to highlight words. To clear highlight use :noh or <ESC> keymapped
vim.o.hlsearch = true
vim.o.incsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Set termguicolors for better colors in nvim
vim.o.termguicolors = true

-- Add scroll buffer of 8 lines (means that going down will ensure 8 lines are maintained at the botttom form cursor)
vim.o.scrolloff = 8

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Draw relative number column first and then signcolumn
vim.o.statuscolumn = "%=%r%s"

-- Configure how new splits would be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live as you type
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Append files with @ in filename to recognized files
vim.opt.isfname:append("@-@")

-- Enable mouse mode in all vim modes
vim.o.mouse = "a"

--  Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- Use C-V while in insert mode or other OS window to paste yanked contents.
vim.o.clipboard = "unnamedplus"

-- Disable backup and swapfile and enable long history for undo tree plugin
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,preview"

-- Autocmd to remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- User command to disable autoformatting
vim.api.nvim_create_user_command("FormatDisable", function()
	vim.g.disable_autoformat = true
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

-- User command to enable autoformatting
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
