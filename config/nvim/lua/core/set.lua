-- [[ Setting options ]]
-- See `:help vim.o`

-- Set Ruler, TextWidth and indentation configuration
vim.opt.textwidth = 119
vim.opt.colorcolumn = {120}
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Set relative number
vim.opt.nu = true
vim.opt.rnu = true

-- Set EOL, Whitespace, Trailing, Whitespace
vim.opt.listchars:append{eol = "¬", lead = "·", trail = "·", space = "·", tab = "<->", precedes = "<", extends = ">"}
vim.opt.list = true

-- Configure tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Configure vim smart indent
vim.opt.smartindent = true

-- Disable wrapping
vim.opt.wrap = false

-- Set highlight on search
vim.o.hlsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set termguicolors for better colors in nvim
vim.o.termguicolors = true
