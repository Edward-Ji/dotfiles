return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            rust = { 'rustfmt' },
        },
    },
}
