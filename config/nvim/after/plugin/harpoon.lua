-- harpoon is an utility that makes effective switching contents

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- save file in harpoon (for switching to it later)
vim.keymap.set('n', '<leader>a', mark.add_file)
-- open harpoon menu to check files that are saved
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- Navigate / access to file saved in first position
vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
-- Navigate / access to file saved in second position
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
-- Navigate / access to file saved in third position
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
-- Navigate / access to file saved in fourth position
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
