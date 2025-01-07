return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local mason_registry = require "mason-registry"
      local codelldb = mason_registry.get_package "codelldb"
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      -- If you are on Linux, replace the line above with the line below:
      -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      local cfg = require "rustaceanvim.config"

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
  -- slint ui
  {
    "slint-ui/vim-slint",
    ft = "slint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    -- config = function()
    --   local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --   local on_attach = on_attach
    --
    --   require("lsp_lines").setup {
    --
    --     require("lspconfig")["slint_lsp"].setup {
    --       cmd = { "slint-lsp" },
    --       filetypes = { "slint" },
    --       single_file_support = true,
    --       capabilities = capabilities,
    --       on_attach = on_attach,
    --       settings = {},
    --     },
    --  }
    -- end,
  },
}
