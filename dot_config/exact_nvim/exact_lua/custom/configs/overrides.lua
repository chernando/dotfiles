local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",

    "markdown",
    "markdown_inline",

    "python",

    "typescript",
    "javascript",
    "html",
    "css",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "stylua",

    -- python
    "pyright",
    "black",

    -- typescript
    "typescript-language-server",
    "prettier",
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
