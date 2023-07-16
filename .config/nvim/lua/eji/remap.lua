vim.keymap.set('n', '<M-j>', ":move .+1<CR>==", {silent = true})
vim.keymap.set('n', '<M-k>', ":move .-2<CR>==", {silent = true})

vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv", {silent = true})
