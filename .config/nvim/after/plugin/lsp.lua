local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    black,
    clangd,
    pylint,
    pyright,
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
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
