-- other general vim settings and keybindings that are adapted

-- GENERAL SETTINGS
vim.cmd("set tabstop=4") -- set tabs to be displayed as 4 spaces
vim.cmd("set termguicolors") -- add truecolour suport
vim.cmd("colorscheme onedark") -- set colorscheme
vim.cmd("set number") -- set linenumbers
vim.cmd("set nowrap") -- disable line-wrapping

-- KEYBINDINGS AND REMAPS
vim.g.mapleader = " " -- set leader to space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- leader pv shortcut to get to file explorer
local builtin = require('telescope.builtin') -- some telescope shortcuts
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
