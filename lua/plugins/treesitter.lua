-- treesitter for programming language-aware grammar
return {
		"nvim-treesitter/nvim-treesitter",
		build = function()
				require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		-- need to use a config function here because it takes effect on .configs instead of the main plugin
		config = function () 
				local configs = require("nvim-treesitter.configs")

				configs.setup({
						ensure_installed = {
							"python",
							"fortran",
							"c",
							"cpp",
							"vim",
							"vimdoc",
							"html",
						},  -- must have installed parsers
						sync_install = false,
						auto_install = true,  -- automatically install missing parser when entering buffer
						highlight = { enable = true }, -- activate syntax highlighting
						indent = { enable = false },  -- let other plugins handle indenting
						incremental_selection = {
							enable = true,
							keymaps = {
								init_selection = "<C-space>", -- select current grammar node
								node_incremental = "<C-space>", -- select parent node
								scope_incremental = false,
								node_decremental = "<bs>", -- backspace will go backwards
							},
						},
				})
		end,
}
