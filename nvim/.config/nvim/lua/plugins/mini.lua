return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"dashboard",
				"fzf",
				"help",
				"mason",
				"neo-tree",
				"notify",
				"Trouble",
				"trouble",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
