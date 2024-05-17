-- [[ Basic Keymaps ]]

-- Using nerd font
vim.g.have_nerd_font = true

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap (in case enabled, this setup is `set nowrap`)
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep cursor at current position when moving next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- This is going to get me cancelled. Only difference for now between ESC and C-c is for block editring
vim.keymap.set("i", "<C-c>", "<Esc>")

-- This is really going to get me cancelled
vim.keymap.set("i", "<C-s>", "<C-c><cmd>w<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- Remove usage of weird Q command
vim.keymap.set("n", "Q", "<nop>")

-- Greatest remaps ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without modifying registers" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without modifying registers" })

-- sessionizer integration in nvim remap
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")

-- Shortcut to give exec permissions to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Search and replace current word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Aerial Toggle
vim.keymap.set("n", "<leader>dt", "<cmd>AerialToggle!<CR>", { desc = "[D]ocument [T]oggle using Aerial" })

-- Improve qflist and loclist navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>cprev<CR>zz")

-- Set <Shift-ArrowKey> to move between Nvim Buffers and Tmux panes
vim.g.tmux_navigator_no_mappings = 1
vim.cmd("noremap <silent> <s-Left> :<C-U>TmuxNavigateLeft<cr>")
vim.cmd("noremap <silent> <s-Right> :<C-U>TmuxNavigateRight<cr>")
vim.cmd("noremap <silent> <s-Down> :<C-U>TmuxNavigateDown<cr>")
vim.cmd("noremap <silent> <s-Up> :<C-U>TmuxNavigateUp<cr>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list as loclist" })
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setqflist, { desc = "Open diagnostics list as qflist" })

vim.diagnostic.config({
	virtual_text = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Resize window keymap
vim.keymap.set("n", "<M-h>", "<c-w>5<", { desc = "Resize window up" })
vim.keymap.set("n", "<M-l>", "<c-w>5>", { desc = "Resize window up" })
vim.keymap.set("n", "<M-k>", "<c-w>5+", { desc = "Resize window up" })
vim.keymap.set("n", "<M-j>", "<c-w>5-", { desc = "Resize window up" })

-- Center screen after jump keymaps
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
