return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "dark",
			transparent = false, -- theme transparency
		})
		onedark.load() -- load the theme
	end,
}
