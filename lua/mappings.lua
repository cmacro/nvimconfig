require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim dap
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Go related mappings
map("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go Run" })
map("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go Test" })
map("n", "<leader>gi", "<cmd>GoImport<cr>", { desc = "Go Import" })
map("n", "<leader>gf", "<cmd>GoFmt<cr>", { desc = "Go Format" })

-- Go debug related mappings
map("n", "<leader>dgt", "<cmd>lua require'dap-go'.debug_test()<CR>", { desc = "Debug go test" })
map("n", "<leader>dgl", "<cmd>lua require'dap-go'.debug_last()<CR>", { desc = "Debug last go test" })

-- Python related mappings
map("n", "<leader>pr", "<cmd>!python3 %<cr>", { desc = "run Python file" })
map("n", "<leader>pc", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "run Python test class" })
map("n", "<leader>ps", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "debug Python selection" })
