return {
    'tpope/vim-fugitive',

    'wakatime/vim-wakatime',

    { 'numToStr/Comment.nvim', opts = { ignore = '^$' }, lazy = false },

    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

    { 'williamboman/mason.nvim', lazy = false, config = true },
}
