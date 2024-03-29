-- [[ Setting options ]]
-- See `:help vim.o`

-- Set Ruler, TextWidth and indentation configuration
vim.opt.textwidth = 119
vim.opt.colorcolumn = {120}

-- Disable wrapping
vim.opt.wrap = false

-- Set relative number
vim.opt.nu = true
vim.opt.rnu = true

-- Set EOL, Whitespace, Trailing, Whitespace
vim.opt.listchars:append({ eol = "↵", lead = "·", trail = "·", space = "·", tab = "→ ", precedes = "<", extends = ">" })
vim.opt.list = true

-- Configure tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Configure vim smart indent
vim.opt.smartindent = true

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Set termguicolors for better colors in nvim
vim.o.termguicolors = true

-- Add scroll buffer of 8 lines (means that going down will ensure 8 lines are maintained at the botttom form cursor)
vim.o.scrolloff = 8

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Enable mouse mode in all vim modes
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

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
vim.o.completeopt = 'menuone,noselect'
