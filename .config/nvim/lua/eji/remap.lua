vim.g.leadermap = '\\'

vim.keymap.set('n', '<M-j>', "V:move '>+1<CR>gv=")
vim.keymap.set('n', '<M-k>', "V:move '<-2<CR>gv=")

vim.keymap.set('v', '<M-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<M-k>', ":move '<-2<CR>gv=gv")
