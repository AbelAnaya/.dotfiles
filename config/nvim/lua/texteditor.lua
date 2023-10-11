-- Set Ruler, TextWidth and indentation configuration
vim.opt.textwidth = 79
vim.opt.colorcolumn = {120}
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Set relative number
vim.opt.rnu = true

-- Set EOL, Whitespace, Trailing, Whitespace
vim.opt.listchars:append{eol = "¬", space = "·", tab = "->", precedes = "<", extends = ">"}
vim.opt.list = true
