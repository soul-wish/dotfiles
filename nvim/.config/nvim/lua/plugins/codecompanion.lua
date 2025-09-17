return {
	"olimorris/codecompanion.nvim",
	opts = {
		provider = "copilot",
	},
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
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
