local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { "catppuccin/nvim", name = "catppuccin" },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    'wakatime/vim-wakatime',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        dependencies = "nvim-treesitter/nvim-treesitter"
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'}
    },

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
        }
    }
})
