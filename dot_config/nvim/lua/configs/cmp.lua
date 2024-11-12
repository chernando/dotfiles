local M = {}

M.sources = {
	{ name = "copilot", group_index = 2 },
	{ name = "nvim_lsp", group_index = 2 },
	{ name = "luasnip", group_index = 2 },
	{ name = "buffer", group_index = 3 },
	{ name = "nvim_lua", group_index = 2 },
	{ name = "path", group_index = 3 },
}

M.sorting = {
	priority_weight = 2,
	comparators = {
		require("copilot_cmp.comparators").prioritize,
	},
}

M.formatting = {
	format = function(entry, vim_item)
		vim_item.kind = require("nvchad.icons.lspkind")[vim_item.kind]
		vim_item.menu = ({
			copilot = "[COP]",
			nvim_lsp = "[LSP]",
			luasnip = "[SNP]",
			buffer = "[BUF]",
			nvim_lua = "[LUA]",
			path = "[PTH]",
		})[entry.source.name]
		return vim_item
	end,
}

return M
