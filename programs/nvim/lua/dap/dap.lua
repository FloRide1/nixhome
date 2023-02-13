-- Hide statuline inside dap's buffers
vim.cmd([[
autocmd BufEnter dapui* set statusline=\ 
autocmd BufEnter dap-repl set statusline=\ 
]])
-- call dap-ui automatically from dap when launching/closing a debugging session

local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define('DapBreakpoint',			{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected',	{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',			{text='', texthl='', linehl='', numhl=''})

-- vim.keymap.set('n', '<C-b>', function() require"dap".toggle_breakpoint() end)
-- vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>") vim.keymap.set('n', '<C-o>', function() require"dap".step_out() end)
-- vim.keymap.set('n', '<C-s>', function() require"dap".step_into() end)
-- vim.keymap.set('n', '<C-n>', function() require"dap".step_over() end)
-- vim.keymap.set('n', '<A-c>', function() require"dap".continue() end)
-- vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
-- vim.keymap.set('n', '<C-c>', function() require"dap".terminate() end)
-- vim.keymap.set('n', '<leader>dR', function() require"dap".clear_breakpoints() end)
-- vim.keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
-- vim.keymap.set('n', '<C-k>', function() require"dap.ui.widgets".hover() end)
-- vim.keymap.set('n', '<A-k>', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
-- vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
-- vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
-- vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
