local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "golines" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },

  formatters = {
    -- Golang
    golines = {
      prepend_args = { "--max-len=120" },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
