-- Reset highlight search on escape
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Move line or selection up or down with proper indenting
vim.keymap.set('n', '<M-k>', ":move .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set('n', '<M-j>', ":move .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- Buffer management
vim.keymap.set('n', '<Tab>', "<Cmd>bnext<CR>")
vim.keymap.set('n', '<S-Tab>', "<Cmd>bprevious<CR>")
for i = 1, 10 do
    local lhs = "<Leader>b" .. (i == 10 and 0 or i)
    local rhs = "<Cmd>silent! LualineBuffersJump " .. i .. "<CR>"
    vim.keymap.set('n', lhs, rhs)
end
vim.keymap.set('n', '<Leader>bd', "<Cmd>bdelete<CR>")
