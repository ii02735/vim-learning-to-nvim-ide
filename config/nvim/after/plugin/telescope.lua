-- This file has the responsability to handle telescope's remaps

local builtin = require('telescope.builtin')
-- To find files
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = '[S]earch [F]iles'})
-- To find files sourced by Git (less cumbersome : avoid useless directories like node_modules or vendor for example)
vim.keymap.set('n', '<leader>gp', builtin.git_files, { desc = '[S]earch [F]iles tracked by [G]it'})
-- To find files that has a specific content (grep search like)
vim.keymap.set('n', '<leader>P', builtin.live_grep, { desc = '[S]earch by [G]rep' })
