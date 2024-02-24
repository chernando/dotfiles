--type conform.options
local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		css = { "prettier" },
		graphql = { "prettier" },
		handlebars = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		jsonc = { "prettier" },
		json = { "prettier" },
		less = { "prettier" },
		lua = { "stylua" },
		["markdown.mdx"] = { "prettier" },
		markdown = { "prettier" },
		python = { "black" },
		scss = { "prettier" },
		sh = { "shfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		yaml = { "prettier" },
	},
}

require("conform").setup(options)
