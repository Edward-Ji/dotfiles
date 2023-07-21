require('lualine').setup {
    options = {
        theme = 'auto',
        ignore_focus = {
            'NvimTree'
        },
        globalstatus = true
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 2,
                max_length = vim.o.columns * 2 / 3,
                symbols = {
                    modified = ' +'
                }
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                'tabs',
                max_length = vim.o.columns / 3,
            }
        }
    },
    winbar = {
        lualine_a = {},
        lualine_b = {
            'searchcount'
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    }
}
