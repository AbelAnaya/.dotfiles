return {
  "mbbill/undotree",
  config = function()
    -- set keymaps
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
