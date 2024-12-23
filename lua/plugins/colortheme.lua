return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "dark",
			transparent = true, -- theme transparency
		})
		onedark.load() -- load the theme
	end

}
