return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lua', -- source for nvim lua API
      'hrsh7th/cmp-buffer', -- source for text in buffer
      'hrsh7th/cmp-path', -- source for file system paths
      'hrsh7th/cmp-cmdline', -- source for cmd line
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim', -- vs-code like pictograms

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        local lspkind = require 'lspkind'
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        cmp.setup ({
          completion = {
                completeopt = "menu,menuone,preview",
          },
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          window = {
              documentation = cmp.config.window.bordered(),
              completion = cmp.config.window.bordered()
          },
          mapping = cmp.mapping.preset.insert {
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete {},
            ['<C-e>'] = cmp.mapping.abort(),
            ['<C-y>'] = cmp.mapping.confirm {
              select = true,
            },

            ['<Tab>'] = nil,
            ['<S-Tab>'] = nil,
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' }, -- nvim lsp suggestions
            { name = 'luasnip' }, -- snippets
            { name = 'buffer' }, -- text within current buffer
            { name = 'path' }, -- file system paths
            { name = 'cmdline' }, -- command line
            }, {
                    { name = 'buffer' },
                }),

          -- configure lspkind for vs-code like pictograms in completion menu
          formatting = {
                  format = lspkind.cmp_format({
                  maxwidth = 50,
                  ellipsis_char = "...",
                }),
            },
        })

    end,
}
