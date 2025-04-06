return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<F3>',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            mode = '',
            desc = 'Format buffer',
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
            rust = { 'rustfmt' },
        },
    },
}
