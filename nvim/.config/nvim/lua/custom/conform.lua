return { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    config = function()
        require("conform").setup({
            notify_on_error = true,
            notify_no_formatters = true,
            format_on_save = function(bufnr)
                -- Disable autoformat for certain filetypes
                local disable_filetypes = { c = true, cpp = true }
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
            },
        })

        -- User command to disable autoformatting
        vim.api.nvim_create_user_command("FormatDisable", function()
            vim.g.disable_autoformat = true
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        -- User command to enable autoformatting
        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })
    end,
}
