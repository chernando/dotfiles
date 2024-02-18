--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    python = { "black" },

    typescript = { "prettier" },
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
  },
}

require("conform").setup(options)
