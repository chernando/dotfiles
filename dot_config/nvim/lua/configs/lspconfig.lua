-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Extend default capabilities with file watching
local capabilities = vim.deepcopy(nvlsp.capabilities)
local flags = {
  debounce_text_changes = 150,
  allow_incremental_sync = true,
}

local servers = {
  "astro",
  "cssls",
  "html",
  "pyright",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
    flags = flags,
  }
end

-- TypeScript specific configuration
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  flags = flags,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'relative',
      includeInlayParameterNameHints = 'all',
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
    },
    watchFiles = true
  }
}
