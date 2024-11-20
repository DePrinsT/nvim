-- other general vim settings and keybindings that are adapted

-- COLOUR SETTING
vim.cmd("set termguicolors") -- add truecolour suport
vim.cmd("colorscheme onedark") -- set colorscheme

-- TAB SETTINGS
vim.cmd("set tabstop=4") -- set tabs to be displayed as 4 spaces
vim.cmd("set softtabstop=0") -- use same value as tabstop
vim.cmd("set shiftwidth=0") -- use same value as tabstop
vim.cmd("set expandtab") -- expand a tab character to appropriate amount of spaces if pressed
vim.cmd("set smartindent") -- use smart indenting
-- note that some of the tab settings above will be overriden by the guess-indent.nvim plugin
-- for the active buffer (it'll try to choose these in a smart manner)

-- LINE SETTINGS
vim.cmd("set number") -- set linenumbers
vim.cmd("set nowrap") -- disable line-wrapping
vim.cmd("set relativenumber") -- set relative line numbers

-- SEARCHING SETTINGS
vim.cmd("set nohlsearch") -- deactivate highlighting when searching
vim.cmd("set incsearch") -- activate incremental search

-- KEYBINDINGS AND REMAPS

-- some general master settings
vim.g.mapleader = " " -- set leader to space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- shortcut to get to file explorer

-- some telescope shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- use J and K to move up and down selected lines in visual mode. Also adapts indentation accordingly :)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 
-- allows for search terms to stay in the middle of the screen
vim.keymap.set("n", "n", "nzzzv") 
vim.keymap.set("n", "N", "Nzzzv")

-- allows for cursor to stay in the middle of the screen when doing half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- if pasting this way over a visual selection paste buffer isn't replaced
vim.keymap.set("x", "<leader>p", "\"_dP")

-- some more pasting options, this time to paste to the +y register, i.e. sytem clipboard
vim.keymap.set("n", "<leader>y", "\"+y") -- for normal yank in normal mode
vim.keymap.set("v", "<leader>y", "\"+y") -- normal yank in visual mode
vim.keymap.set("n", "<leader>Y", "\"+Y") -- yy yank in normal mode

-- MISCELLANEOUS SETTINGS
vim.cmd("set updatetime=50") -- set fast upate time
vim.cmd("set colorcolumn=80,120") -- colour columns at 80 and 120 characters to indicate lines getting too long
