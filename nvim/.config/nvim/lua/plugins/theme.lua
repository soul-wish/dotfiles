return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		setup = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					notify = true,
				},
			})
		end,
		init = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
