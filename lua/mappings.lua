require "nvchad.mappings"

-- remove default keys
vim.keymap.del("n", "<Leader>n") -- toggle line number
vim.keymap.del("n", "<Tab>") -- tab jump buffer  
vim.keymap.del("n", "<S-Tab>") -- tab jump buffer  

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope diagnostics window" })
map("n", "<leader>tl", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Telescope diagnostics list" })

vim.keymap.set("n", "<Leader>dv", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Debugger view" })
vim.keymap.set(
  "n",
  "<Leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" }
)
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

-- map("n", "<leader>dt", ":GoTestFunc<CR>", { desc = "Test current function" })
-- map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
map(
  "n",
  "<Leader>dt",
  "<cmd>lua require'comm'.run_test()<CR>",
  { noremap = true, silent = false, desc = "Test current function" }
)

map("n", "<Leader>dgt", "<cmd>lua require('dap-go').debug_test()<CR>", {desc="Debugger test function"})
map("n", "<Leader>dgl", "<cmd>lua require('dap-go').debug_last_test()<CR>", {desc="Debugger last test function"})


vim.keymap.set("n", "<leader>fJ", function()
  vim.bo.filetype = "json"
  vim.cmd("%!prettier --parser json")
end, { desc = "Format JSON using Prettier" })
