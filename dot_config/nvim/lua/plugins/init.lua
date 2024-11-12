local overrides = require("configs.overrides")

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			panel = { enabled = false },
			filetypes = {
				python = true,
				javascript = true,
				typescript = true,
				sh = true,
				bash = true,
				dockerfile = true,
				yaml = true,
				["docker-compose"] = true,
				markdown = true,
				["."] = false,
			},
			suggestion = {
				enabled = false,
				auto_trigger = true,
				keymap = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			copilot_node_command = "node",
			server_opts_overrides = {
				settings = {
					advanced = {
						listCount = 10,
						inlineSuggestCount = 3,
					},
				},
			},
		},
	},

	-- Override plugin definition options
	{
		"stevearc/conform.nvim",
		opts = overrides.conform,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				dependencies = "copilot.lua",
				config = function()
					require("copilot_cmp").setup({
						event = { "InsertEnter", "LspAttach" },
						fix_pairs = true,
						select_behavior = "application/vnd.copilot.select",
					})
				end,
			},
		},
		opts = function()
			local default = require("nvchad.configs.cmp")
			local custom = require("configs.cmp")

			default.sources = custom.sources
			default.sorting = custom.sorting
			default.formatting = custom.formatting

			default.mapping = vim.tbl_extend("force", default.mapping, {
				["<C-e>"] = require("cmp").mapping.abort(), -- Cerrar el menú
				["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
				["<C-f>"] = require("cmp").mapping.scroll_docs(4),
			})
			return default
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Disabled plugins
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},
}
