return {
	'nmac427/guess-indent.nvim',
	config = function()
		local guess_indent = require("guess-indent")

		guess_indent.setup({
			auto_cmd = true, -- automatically exec command to set indent options
		})
	end

}
