local overrides = require "configs.overrides"

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        python = true,
        javascript = true,
        typescript = true,
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
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      local default = require "nvchad.configs.cmp"
      local custom = require "configs.cmp"
      default.sources = custom.sources
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
