require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Astro
  "astro",
  -- Bash
  "bashls",
  -- Docker
  "docker_language_server",
  -- Fish
  "fish_lsp",
  -- JSON
  "jsonls",
  -- Python
  "pyright",
  -- TypeScript
  "ts_ls",
  -- YAML
  "yamlls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
