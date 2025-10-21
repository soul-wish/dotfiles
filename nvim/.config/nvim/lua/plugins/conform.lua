return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 2000,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			["javascript"] = { "eslint_d", "prettierd" },
			["javascriptreact"] = { "eslint_d", "prettierd" },
			["typescript"] = { "eslint_d", "prettierd" },
			["typescriptreact"] = { "eslint_d", "prettierd" },
			["vue"] = { "eslint_d", "prettierd" },
			["css"] = { "prettierd" },
			["scss"] = { "prettierd" },
			["less"] = { "prettierd" },
			["html"] = { "eslint_d", "prettierd" },
			["json"] = { "prettierd" },
			["jsonc"] = { "prettierd" },
			["yaml"] = { "prettierd" },
			["markdown"] = { "prettierd" },
			["markdown.mdx"] = { "prettierd" },
			["graphql"] = { "prettierd" },
			["handlebars"] = { "prettierd" },
			["svelte"] = { "eslint_d", "prettierd" },
		},
	},
}
