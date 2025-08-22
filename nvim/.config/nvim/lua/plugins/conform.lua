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
					timeout_ms = 500,
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
			["css"] = { "eslint_d", "prettierd" },
			["scss"] = { "eslint_d", "prettierd" },
			["less"] = { "eslint_d", "prettierd" },
			["html"] = { "eslint_d", "prettierd" },
			["json"] = { "eslint_d", "prettierd" },
			["jsonc"] = { "eslint_d", "prettierd" },
			["yaml"] = { "eslint_d", "prettierd" },
			["markdown"] = { "eslint_d", "prettierd" },
			["markdown.mdx"] = { "eslint_d", "prettierd" },
			["graphql"] = { "eslint_d", "prettierd" },
			["handlebars"] = { "eslint_d", "prettierd" },
			["svelte"] = { "eslint_d", "prettierd" },
		},
	},
}
