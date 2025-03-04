return {
  -- Go related config
  {
    -- debug command
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    -- opts = function(_, opts)
    --   local dap = require "dap"
    --
    --   dap.adapters.delve = {
    --     type = "server",
    --     port = "${port}",
    --     executable = {
    --       command = "dlv",
    --       args = { "dap", "-l", "127.0.0.1:${port}" },
    --     },
    --   }
    --
    --   -- Ensure we don't blow away existing debug configs
    --   dap.configurations.go = dap.configurations.go or {}
    --
    --   -- Insert a NEW configuration
    --   table.insert(dap.configurations.go, {
    --     type = "delve",
    --     name = "Debug (Display print outputs)",
    --     request = "launch",
    --     program = "${file}",
    --     outputMode = "remote",
    --   })
    --
    --   return opts
    -- end,
    -- config = function()
    --   require("dap-go").setup()
    -- end,
    config = function()
      local dap_go = require "dap-go"
      dap_go.setup()

      local dap = require "dap"
      dap.configurations.go = dap.configurations.go or {}
      -- #109 fixed
      -- table.insert(dap.configurations.go, 1, {
      --   type = "go",
      --   name = "Debug (Display print outputs)",
      --   request = "launch",
      --   program = "${file}",
      --   outputMode = "remote", -- capturing the output of fmt.Print
      -- })

      table.insert(dap.configurations.go, {
        type = "go",
        name = "Debug Package in bin",
        request = "launch",
        program = "${fileDirname}",
        -- program = "${workspaceFolder}/bin/${workspaceFolderBasename}",
        cmd = "${workspaceFolder}/bin/",
        rootPath = "${workspaceFolder}/bin/",
        outputMode = "remote", --  configs.delve.output_mode,
      })
    end,
  },
}
