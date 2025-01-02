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

-- !!! KEYBINDINGS AND REMAPS !!!

-- Note: the LSP keymaps are defined in the lspconfig.lua file
-- these are only activated if an LSP actually attaches to the open buffer

-- some general master settings
vim.g.mapleader = " " -- set leader to space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- shortcut to get to file explorer

-- some telescope shortcuts
local tel_builtin = require("telescope.builtin")
local tel_actions = require("telescope.actions")
vim.keymap.set("n", "<leader>ff", tel_builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb", tel_builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fr", tel_builtin.oldfiles, { desc = "Telescope find recent files" }) 
vim.keymap.set("n", "<leader>fg", tel_builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fc", tel_builtin.grep_string, { desc = "Telescope grep for string under cursor" })
vim.keymap.set("n", "<leader>fh", tel_builtin.help_tags, { desc = "Telescope help tags" })
-- NOTE: there are some other keymaps which are specified in the mappings
-- in the telescope.lua file instead (though these are only used inside telescope itself)
--
-- open lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", {desc = "LazyGit"}) 

-- use leader bd to delete current buffer
vim.keymap.set("n", "<leader>bd", vim.cmd.bd) -- delete current buffer

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
vim.diagnostic.enable(false)  -- do not show diagnostics as text on the screen
vim.cmd("autocmd BufRead * set formatoptions-=cro") -- do not make a new line after a comment automatically a comment

