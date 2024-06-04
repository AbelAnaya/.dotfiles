return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
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
                question_header = "",
                answer_header = "",
                error_header = "",
                allow_insecure = true,
                mappings = {
                    submit_prompt = {
                        insert = "",
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
                        description = "[A]I [F]ix",
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
    },
}
