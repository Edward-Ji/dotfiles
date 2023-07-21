vim.keymap.set('n', '<M-j>', ":move .+1<CR>==", {silent = true})
vim.keymap.set('n', '<M-k>', ":move .-2<CR>==", {silent = true})

vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv", {silent = true})

vim.keymap.set('n', '<Tab>', "<Cmd>bnext<CR>", {silent = true})
vim.keymap.set('n', '<S-Tab>', "<Cmd>bprevious<CR>", {silent = true})
for i = 1, 10 do
    local lhs = "<Leader>" .. (i == 10 and 0 or i)
    local rhs = "<Cmd>LualineBuffersJump " .. i .. "<CR>"
    vim.keymap.set('n', lhs, rhs, {silent = true})
end
vim.keymap.set('n', '<Leader>d', "<Cmd>bdelete<CR>", {silent = true})
