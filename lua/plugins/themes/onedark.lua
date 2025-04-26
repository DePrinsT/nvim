return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "dark",
			transparent = false, -- theme transparency
			-- Change code style ---
    		-- Options are italic, bold, underline, none
    		-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    		code_style = {
    		    comments = 'italic',
    		    keywords = 'italic',
    		    functions = 'none',
    		    strings = 'none',
    		    variables = 'none',
    		},
			highlights = {
				-- for c programming with include statements
				["@keyword.import"] = { fmt = "italic"},
			},
		})
		onedark.load() -- load the theme
	end,
}
