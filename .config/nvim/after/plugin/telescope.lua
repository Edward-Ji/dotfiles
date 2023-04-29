local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup{
	defaults = {
		mappings = { i = { ['<esc>'] = actions.close } }
	},
	pickers = {
		find_files = {
			find_command = { 
				'rg', '--files', '--hidden', '--glob', '!**/.git/*'
			}
		},
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        },
	}
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
