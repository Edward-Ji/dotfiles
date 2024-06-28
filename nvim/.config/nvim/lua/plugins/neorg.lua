return {
    'nvim-neorg/neorg',
    dependencies = {
        {
            'vhyrro/luarocks.nvim',
            priority = 1000,
            config = true,
        },
        {
            '3rd/image.nvim',
            config = true,
        },
    },
    lazy = false,
    version = '*',
    config = function()
        require('neorg').setup({
            load = {
                ['core.defaults'] = {},
                ['core.keybinds'] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.remap_key('norg', 'n', '<C-Space>', '<A-Space>')
                        end,
                    },
                },
                ['core.concealer'] = {
                    config = {
                        folds = true,
                    },
                },
                ['core.dirman'] = {
                    config = {
                        workspaces = {
                            notes = '~/notes',
                        },
                    },
                },
                ['core.latex.renderer'] = {
                    config = {
                        render_on_enter = true,
                    },
                },
            },
        })

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
