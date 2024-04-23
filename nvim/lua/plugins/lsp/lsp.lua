return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', config = function() require('neodev').setup() end },
    },

    config = function()

        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- [[ Configure LSP ]]
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(client, bufnr)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
          end

          nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

          nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

          nmap('gt', vim.lsp.buf.type_definition, '[G]oto [t]ype definition')

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = '[C]ode [A]ction', noremap = true, silent = true })

          nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- See `:help K` for why this keymap
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('<leader>rs', ':LspRestart<CR>', '[R]e[s]tart LSP')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')

          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP' })

          nmap('<leader>fb', ':Format<CR>', '[F]ormat [B]uffer')

        end

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Add configuration for any LSP for desired language

        -- configure bash server
        lspconfig["bashls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure c/c++ server
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure python server
        lspconfig["html"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure python server
        lspconfig["pylsp"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure denols server
        lspconfig["denols"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure cssls server
        lspconfig["cssls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure python server
        lspconfig["rust_analyzer"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })

    end,
}
