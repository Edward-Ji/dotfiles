function config()
    local lspconfig = require('lspconfig')
    lspconfig.texlab.setup {
        settings = {
            texlab = {
                forwardSearch = {
                    executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
                    args = { "-n", "-g", "%l", "%p", "%f" }
                },
                build = {
                    forwardSearchAfter = true,
                    onSave = true
                }
            }
        }
    }

    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end)

    lsp.setup()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    require('luasnip.loaders.from_snipmate').lazy_load()

    cmp.setup({
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        sources = {
            {name = 'nvim_lsp'},
            {name = 'buffer'},
            {name = 'path'},
            {name = 'luasnip'}
        },
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            ['<Tab>'] = cmp_action.luasnip_supertab(),
            ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            ['<A-Space>'] = cmp.mapping.complete()
        }
    })
end

return {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {
                'williamboman/mason.nvim',         -- Optional
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = config
    }
}
