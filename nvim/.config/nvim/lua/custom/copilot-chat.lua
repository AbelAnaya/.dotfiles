return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
        local chat = require("CopilotChat")
        local actions = require("CopilotChat.actions")
        local integration = require("CopilotChat.integrations.telescope")

        local function pick(pick_actions)
            return function()
                integration.pick(pick_actions(), {})
            end
        end

        chat.setup({
            model = "claude-3.5-sonnet",
            question_header = "",
            answer_header = "",
            error_header = "",
            allow_insecure = true,
            mappings = {
                close = {
                    insert = "",
                },
                complete = {
                    insert = "",
                },
                submit_prompt = {
                    insert = "<C-s>",
                },
                reset = {
                    normal = "",
                    insert = "",
                },
            },
            prompts = {
                Explain = {
                    mapping = "<leader>ae",
                    description = " [A]I [E]xplain",
                },
                Review = {
                    mapping = "<leader>ar",
                    description = "[A]I [R]eview",
                },
                Tests = {
                    mapping = "<leader>at",
                    description = "[A]I [T]ests",
                },
                Fix = {
                    mapping = "<leader>af",
                    description = "[A]I [f]ix",
                },
                FixDiagnostic = {
                    mapping = "<leader>aF",
                    description = "[A]I [F]ix Diagnostic",
                },
                Optimize = {
                    mapping = "<leader>ao",
                    description = "[A]I [O]ptimize",
                },
                Docs = {
                    mapping = "<leader>ad",
                    description = "[A]I [D]ocumentation",
                },
                CommitStaged = {
                    mapping = "<leader>ac",
                    description = "[A]I Generate [C]ommit",
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>ai", chat.toggle, { desc = "[A][I] Toggle" })
        vim.keymap.set({ "n", "v" }, "<leader>ax", chat.reset, { desc = "[A]I Reset" })
        vim.keymap.set({ "n", "v" }, "<leader>ah", pick(actions.help_actions), { desc = "[A]I [H]elp Actions" })
        vim.keymap.set({ "n", "v" }, "<leader>ap", pick(actions.prompt_actions), { desc = "[A]I [P]rompt Actions" })
    end,
    -- See Commands section for default commands if you want to lazy load on them
}
