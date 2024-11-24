-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- lspconfig.servers = {
--   -- "lua_ls",
--   "gopls",
--   -- "pyright",
-- }

-- 使用 Mason-lspconfig
-- require("mason").setup()
-- require("mason-lspconfig").setup {
--   ensure_installed = { "clangd", "pyright" }, -- 添加 pyright
-- }
--
-- 配置 gopls
-- require("mason-lspconfig").setup_handlers {
--   ["gopls"] = function()
--     lspconfig.gopls.setup {
--       on_attach = require("nvchad.configs.lspconfig").on_attach,
--       capabilities = require("nvchad.configs.lspconfig").capabilities,
--       cmd = { "gopls" },
--       filetypes = { "go", "gomod", "gowork", "gotmpl" },
--       root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--       settings = {
--         gopls = {
--           analyses = {
--             unusedparams = true,
--           },
--           staticcheck = true,
--         },
--       },
--     }
--   end,
-- }

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
}

-- 配置 pyright
-- require("mason-lspconfig").setup_handlers {
-- ["pyright"] = function()
lspconfig.pyright.setup {
  on_attach = require("nvchad.configs.lspconfig").on_attach,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
-- end,
-- }
