require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim dap
-- Add VS Code-like debug mappings for nvim-dap
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue/start" })
map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<S-F11>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map(
  "n",
  "<S-F9>",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)

-- map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
-- map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
-- map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
-- map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
-- map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
-- map(
--   "n",
--   "<Leader>dd",
--   "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
--   { desc = "Debugger set conditional breakpoint" }
-- )
-- map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
-- map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Go related mappings
map("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go Run" })
-- map("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go Test" })
map("n", "<leader>gi", "<cmd>GoImport<cr>", { desc = "Go Import" })
-- map("n", "<leader>gf", "<cmd>GoFmt<cr>", { desc = "Go Format" })
-- map("n", "<leader>gtf", ":GoTestFile<CR>", { desc = "Test current file" })
-- map("n", "<leader>gtc", ":GoTestFunc<CR>", { desc = "Test current function" })

-- go test -v ./<relative-path-to-file>
map("n", "<leader>gtf", ":lua require('go.test').test_file()<CR>", { desc = "Test current file" })
-- go test -run ^TestFunctionName$ ./<relative-path-to-file>
map("n", "<leader>gtc", ":lua require('go.test').test_func()<CR>", { desc = "Test current function" })
-- go test -bench=. ./<relative-path-to-file>
map("n", "<leader>gbf", ":lua require('go.test').benchmark_file()<CR>", { desc = "Benchmark current file" })
-- go test -bench ^BenchmarkFunctionName$ ./<relative-path-to-file>
map("n", "<leader>gbc", ":lua require('go.test').benchmark_func()<CR>", { desc = "Benchmark current function" })

local function run_test_or_benchmark(mode)
  local go_test = require "go.test"

  if mode == "file" then
    -- 运行当前文件的测试和基准
    vim.ui.select({ "Test File", "Benchmark File" }, { prompt = "Select action:" }, function(choice)
      if choice == "Test File" then
        go_test.test_file()
      elseif choice == "Benchmark File" then
        go_test.benchmark_file()
      end
    end)
  elseif mode == "func" then
    -- 运行当前函数的测试和基准
    vim.ui.select({ "Test Function", "Benchmark Function" }, { prompt = "Select action:" }, function(choice)
      if choice == "Test Function" then
        go_test.test_func()
      elseif choice == "Benchmark Function" then
        go_test.benchmark_func()
      end
    end)
  end
end

-- 测试和基准测试的快捷键
map("n", "<leader>gf", function()
  run_test_or_benchmark "file"
end, { desc = "Run test/benchmark for current file" })
map("n", "<leader>gc", function()
  run_test_or_benchmark "func"
end, { desc = "Run test/benchmark for current function" })

-- Python related mappings
map("n", "<leader>pr", "<cmd>!python3 %<cr>", { desc = "run Python file" })
map("n", "<leader>pc", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "run Python test class" })
map("n", "<leader>ps", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "debug Python selection" })
