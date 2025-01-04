return {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- native fuzzy finder speeds up telescope
			'nvim-tree/nvim-web-devicons',
		},
		lazy = false,
		-- config function upon load with extra keymaps used inside telescope
		config = function ()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					layout_strategy = "vertical", -- put things like preview vertically
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						}
					}
				}
			})

			telescope.load_extension("fzf") -- load fzf extension for faster sorting performance

		end
}
