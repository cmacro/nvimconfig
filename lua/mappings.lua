require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local builtin = require "telescope.builtin"
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

vim.keymap.set("n", "<Leader>dv", ":DapUiToggle<CR>", {desc = "Debugger view"})
vim.keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {desc = "Debugger toggle breakpoint"})
vim.keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })

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
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>dtc", ":GoTestFunc<CR>", { desc = "Test current function" })
