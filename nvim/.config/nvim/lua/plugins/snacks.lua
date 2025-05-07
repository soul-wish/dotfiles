return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				header = [[
	███████╗ ██████╗ ██╗   ██╗██╗     ██╗    ██╗██╗███████╗██╗  ██╗
	██╔════╝██╔═══██╗██║   ██║██║     ██║    ██║██║██╔════╝██║  ██║
	███████╗██║   ██║██║   ██║██║     ██║ █╗ ██║██║███████╗███████║
	╚════██║██║   ██║██║   ██║██║     ██║███╗██║██║╚════██║██╔══██║
	███████║╚██████╔╝╚██████╔╝███████╗╚███╔███╔╝██║███████║██║  ██║
	╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝ ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝

					]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = " ",
						key = "m",
						desc = "Mason",
						action = ":Mason",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		terminal = { enabled = true },
		toggle = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename()
			end,
			desc = "Rename File",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
		},
	},
}
