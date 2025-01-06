return {
  -- Go related config
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup()
    end,
  },
}
