local M = {}

M.conform = {
	formatters_by_ft = {
		css = { "prettier" },
		dockerfile = { "hadolint" },
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
		python = { "black", "isort" },
		scss = { "prettier" },
		sh = { "shfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		yaml = { "yamlfmt" },
	},
	formatters = {
		black = {
			prepend_args = { "--line-length=100" },
		},
		isort = {
			prepend_args = { "--profile", "black" },
		},
		shfmt = {
			prepend_args = { "-i", "2", "-ci" },
		},
	},
}

M.treesitter = {
	ensure_installed = {
		"bash",
		"comment",
		"csv",
		"diff",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"jq",
		"json",
		"markdown",
		"markdown_inline",
		"regex",
		"vim",
		"xml",
		"yaml",

		"python",
		"rust",
		"typescript",

		"css",
		"html",
		"javascript",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}

M.mason = {
	pkgs = {
    -- docker
    "docker-langserver",
    "hadolint",

		-- lua
		"lua-language-server",
		"stylua",

		-- python
		"pyright",
    "ruff-lsp",
		"black",
    "isort",
    "debugpy",

		-- typescript
		"typescript-language-server",
		"prettier",

		-- shell
    "bash-language-server",
		"shfmt",
    "shellcheck",

		-- web
		"css-lsp",
		"html-lsp",

    -- yaml
    "yaml-language-server",
    "yamlfmt",

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
