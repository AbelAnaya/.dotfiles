-- Set Ruler, TextWidth and indentation configuration
vim.opt.textwidth = 119
vim.opt.colorcolumn = {120}
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Set relative number
vim.opt.rnu = true

-- Set EOL, Whitespace, Trailing, Whitespace
vim.opt.listchars:append{eol = "¬", lead = "·", trail = "·", space = "·", tab = "<->", precedes = "<", extends = ">"}
vim.opt.list = true

-- Configure tab size
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false
