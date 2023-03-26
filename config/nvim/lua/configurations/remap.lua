-- Set the leader key to the space character / space key
vim.g.mapleader = " "
-- Normal mode customizations
-- Open file explorer through <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
