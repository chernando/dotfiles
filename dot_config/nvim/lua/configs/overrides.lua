local M = {}

M.conform = {
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
