return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap, dapui = require "dap", require "dapui"

      require("dapui").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
      sign("DapLogPoint", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
      sign("DapBreakpointCondition", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
      sign("DapBreakpointRejected", { text = "", texthl = "ErrorMsg", linehl = "ErrorMsg" })
      sign("DapStopped", { text = "󰜴", texthl = "", linehl = "" })
    end,
  },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },
}
