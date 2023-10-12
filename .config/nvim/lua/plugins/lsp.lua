function config()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end)

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

    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = {
            'bashls',
            'clangd',
            'pyright',
            'texlab'
        },
        handlers = { lsp_zero.default_setup }
    })

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
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', config = config},

    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Sources
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
}
