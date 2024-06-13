return {
	"nvimdev/dashboard-nvim",
	config = function()
		local logo = [[
   ███████╗ ██████╗ ██╗   ██╗██╗     ██╗    ██╗██╗███████╗██╗  ██╗
   ██╔════╝██╔═══██╗██║   ██║██║     ██║    ██║██║██╔════╝██║  ██║
   ███████╗██║   ██║██║   ██║██║     ██║ █╗ ██║██║███████╗███████║
   ╚════██║██║   ██║██║   ██║██║     ██║███╗██║██║╚════██║██╔══██║
   ███████║╚██████╔╝╚██████╔╝███████╗╚███╔███╔╝██║███████║██║  ██║
   ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝ ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝
                                                                      
      ]]
		logo = string.rep("\n", 8) .. logo .. "\n\n"
		require("dashboard").setup({
			theme = "doom",
			hide = {
				-- this is taken care of by lualine
				-- enabling this messes up the actual laststatus setting after loading a file
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
      -- stylua: ignore
      center = {
        { action = "Telescope find_files",                                    desc = " Find File",       icon = " ", key = "f" },
        { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
        { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
        { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
        { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
        { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
      },
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },

	event = "VimEnter",
}
