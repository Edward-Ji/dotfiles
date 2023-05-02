require('catppuccin').setup({
    flavour = 'latte', -- latte, frappe, macchiato, mocha
    no_italic = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme 'catppuccin'
