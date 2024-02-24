local M = {}

M.treesitter = {
	ensure_installed = {
		"bash",
		"comment",
		"csv",
		"diff",
		"dockerfile",
		"gitattributes",
		"gitcommit",
		"git_config",
		"gitignore",
		"git_rebase",
		"jq",
		"json",
		"markdown",
		"markdown_inline",
		"regex",
		"xml",

		"python",
		"rust",
		"typescript",

		"css",
		"html",
		"javascript",
	},
}

M.mason = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

		-- python
		"pyright",
		"black",

		-- typescript
		"typescript-language-server",
		"prettier",

		-- shell
		"shfmt",

		-- web
		"css-lsp",
		"html-lsp",

		-- astro
		"astro-language-server",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
