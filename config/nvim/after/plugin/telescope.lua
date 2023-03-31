-- This file has the responsability to handle telescope's remaps

local builtin = require('telescope.builtin')
-- To find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- To find files sourced by Git (less cumbersome : avoid useless directories like node_modules or vendor for example)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- To find files that has a specific content (grep search like)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
