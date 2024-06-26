return {
	"rcarriga/nvim-notify",
	opts = {
		top_down = false,
		stages = "fade_in_slide_out",
	},
	config = function()
		--Enable fancy notifications
		vim.notify = require("notify")
	end,
}
