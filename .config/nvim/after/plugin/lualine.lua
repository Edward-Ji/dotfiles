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
                'tabs',
                max_length = vim.o.columns,
                mode = 2,
                fmt = function(name, context)
                    -- Show + if buffer is modified in tab
                    local buflist = vim.fn.tabpagebuflist(context.tabnr)
                    local winnr = vim.fn.tabpagewinnr(context.tabnr)
                    local bufnr = buflist[winnr]
                    local mod = vim.fn.getbufvar(bufnr, '&mod')

                    return name .. (mod == 1 and ' +' or '')
                end
            }
        }
    },
    winbar = {
        lualine_b = {
            'searchcount'
        }
    }
}
