return {
	"olimorris/codecompanion.nvim",
	opts = {
		provider = "copilot",
	},
	keys = {
		{
			"<Leader>ap",
			"<cmd>CodeCompanionActions<CR>",
			desc = "Open the action palette",
			mode = { "n", "v" },
		},
		{
			"<Leader>a",
			"<cmd>CodeCompanionChat Toggle<CR>",
			desc = "Toggle a chat buffer",
			mode = { "n" },
		},
		{
			"<LocalLeader>a",
			"<cmd>CodeCompanionChat Add<CR>",
			desc = "Add code to a chat buffer",
			mode = { "v" },
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
