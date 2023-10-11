return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with harpoon" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })

    vim.keymap.set("n", "<C-n>", ui.nav_next, { desc = "Go to next harpoon mark" })
    vim.keymap.set("n", "<C-p>", ui.nav_prev, { desc = "Go to previous harpoon mark" })
  end,
}
