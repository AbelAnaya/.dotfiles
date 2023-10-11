return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- set keymaps
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Mark file with harpoon" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })

    vim.keymap.set("n", "<leader>hn", function() ui.nav_next() end, { desc = "Go to next harpoon mark" })
    vim.keymap.set("n", "<leader>hp", function() ui.nav_prev() end, { desc = "Go to previous harpoon mark" })
  end,
}
