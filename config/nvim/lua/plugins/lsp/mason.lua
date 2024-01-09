return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })

        mason_lspconfig.setup({
          -- list of servers for mason to install
          ensure_installed = {
            "clangd",
            "pylsp",
            "rust_analyzer",
            "lua_ls",
            "bashls",
            "html",
            "pylyzer",
            "pyright",
          },
          -- auto-install configured servers (with lspconfig)
          automatic_installation = true, -- not the same as ensure_installed
        })

        mason_tool_installer.setup({
          ensure_installed = {
            "prettier", -- prettier formatter
            "stylua", -- lua formatter
            "isort", -- python formatter
            "black", -- python formatter
            "autopep8", -- pep 8 formatter
            "pylint", -- python linter
            "mypy", -- python linter
            "cpplint", -- cpp linter
            "pydocstyle", -- python doc linter
            "markdownlint", -- markdown linter
          },
        })
    end,
}
