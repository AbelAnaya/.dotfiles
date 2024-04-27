return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function ()

        local treesitter = require('nvim-treesitter.configs')

        treesitter.setup {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                'c',
                'cpp',
                'go',
                'lua',
                'python',
                'rust',
                'tsx',
                'javascript',
                'typescript',
                'vimdoc',
                'vim',
                'markdown',
                'markdown_inline',
                'dockerfile',
                'gitignore',
                'bash',
                'query',
                'yaml',
                'xml',
                'html',
                'json',
                'css',
            },

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
              enable = true,
              keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
              },
            },
        }

    end,
}
