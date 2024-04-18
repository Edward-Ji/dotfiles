return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'luafmt' },
            python = { 'isort', 'black' },
            rust = { 'rustfmt' },
        },
    },
}
