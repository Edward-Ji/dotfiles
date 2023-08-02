vim.opt.guicursor = ''

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.shortmess:append('S')

vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undodir'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.spell = true
vim.opt.spelllang = 'en,cjk'
