vim.g.material_style = 'lighter'
vim.cmd 'colorscheme material'

vim.keymap.set('n', '<leader>ms', require("material.functions").find_style)
