return {
		"nvim-treesitter/nvim-treesitter",
		build = function()
				require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		-- need to use a config function here because it takes effect on .configs instead of the main plugin
		config = function () 
				local configs = require("nvim-treesitter.configs")

				configs.setup({
						ensure_installed = { "python", "fortran", "c", "cpp", "vim", "vimdoc", "html" },  -- must have installed parsers
						sync_install = false, auto_install = true,  -- automatically install missing parser when entering buffer
						highlight = { enable = true }, -- activate highlighting
						indent = { enable = true },  -- activate indentation based on treesitter
				})
		end
}
