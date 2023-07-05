local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    black,
    clangd,
    pylint,
    pyright,
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})

    local opts = {buffer = bufnr}
    local bind = vim.keymap.set

    bind('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
    bind('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<A-Space>'] = cmp.mapping.complete()
    }
})
