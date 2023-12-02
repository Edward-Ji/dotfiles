return {
    'tpope/vim-fugitive',

    'wakatime/vim-wakatime',

    {
        'nmac427/guess-indent.nvim',
        config = true
    },

    {
        'numToStr/Comment.nvim',
        opts = { ignore = '^$' },
        lazy = false
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                python = { "isort", "black" }
            }
        }
    }
}
