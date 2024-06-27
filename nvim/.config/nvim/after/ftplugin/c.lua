vim.opt_local.formatoptions:remove("o")

-- Switch header and source file using LSP
vim.keymap.set("n", "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
