return {
    'R-nvim/R.nvim',
    config = function()
        local opts = {
            R_args = { '--quiet' },
            hook = {
                after_config = function()
                    if vim.o.syntax ~= 'rbrowser' then
                        vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
                        vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
                    end
                end,
            },
            rconsole_width = math.floor(vim.fn.winwidth(0) / 2),
            esc_term = false,
        }
        require('r').setup(opts)
    end,
    lazy = false,
}
