return {
    specs = {
        { src = 'https://github.com/nmac427/guess-indent.nvim' },
        { src = 'https://github.com/windwp/nvim-autopairs' },
    },

    config = function()
        require('guess-indent').setup()
        require('nvim-autopairs').setup()
    end,
}
