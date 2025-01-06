local M = {}

function M.run_test()
  local filetype = vim.bo.filetype

  if filetype == "rust" then
    vim.cmd('RustLsp testables')  -- Rust 测试命令
  elseif filetype == "go" then
    vim.cmd(':GoTestFunc')         -- Go 测试命令
  else
    print("Unsupported filetype for testing: " .. filetype)
  end
end

return M
