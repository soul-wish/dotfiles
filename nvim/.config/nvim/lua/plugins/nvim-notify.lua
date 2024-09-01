return {
	"rcarriga/nvim-notify",
	opts = {
		render = "simple",
		top_down = false,
		stages = "fade",
	},
	init = function()
		--Enable fancy notifications
		vim.notify = require("notify")
	end,
}
