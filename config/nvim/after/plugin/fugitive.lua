-- This file has the responsability to manage key maps for the tpope/vim-fugitive plugin which is a git wrapper
-- Because it is a git wrapper, it is necessary to be inside a git repository in order to make these mappings / fugitive commands work.

-- Git status
vim.keymap.set('n','<leader>gs', vim.cmd.Git);
