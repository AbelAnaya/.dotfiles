return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local refactoring = require("refactoring")
        local ConfigOpts = {
            -- prompt for return type
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            -- prompt for function parameters
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            show_success_message = true,
        }
        refactoring.setup(ConfigOpts)

        vim.keymap.set({ "n", "x" }, "<leader>rr", function()
            refactoring.select_refactor(ConfigOpts)
        end, { desc = "Refactoring: Select refactor" })
    end,
}
