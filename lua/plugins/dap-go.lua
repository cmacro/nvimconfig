return {
  -- Go related config
  -- {
  --   "fatih/vim-go",
  --   ft = "go",
  --   build = ":GoUpdateBinaries",
  -- },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = function(_, opts)
      local dap = require "dap"

      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      -- Ensure we don't blow away existing debug configs
      dap.configurations.go = dap.configurations.go or {}

      -- Insert a NEW configuration
      table.insert(dap.configurations.go, {
        type = "delve",
        name = "Debug (Display print outputs)",
        request = "launch",
        program = "${file}",
        outputMode = "remote",
      })

      return opts
    end,
    -- config = function()
    --   require("dap-go").setup()
    -- end,
  },
  }
