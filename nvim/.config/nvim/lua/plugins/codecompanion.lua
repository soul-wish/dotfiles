return {
	"olimorris/codecompanion.nvim",
	keys = {
		{
			"<Leader>an",
			"<cmd>CodeCompanionChat<CR>",
			desc = "New chat buffer",
			mode = { "n" },
		},
		{
			"<Leader>at",
			"<cmd>CodeCompanionChat Toggle<CR>",
			desc = "Toggle a chat buffer",
			mode = { "n" },
		},
		{
			"<LocalLeader>ac",
			"<cmd>CodeCompanionChat Add<CR>",
			desc = "Add code to a chat buffer",
			mode = { "v" },
		},
	},
	config = function()
		require("codecompanion").setup({
			provider = "copilot",
			display = {
				chat = {
					auto_scroll = false,
					window = {
						width = 0.35,
					},
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
