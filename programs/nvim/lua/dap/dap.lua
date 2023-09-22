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

-- vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>") 
-- vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
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

dap.adapters.lldb = {
    type = 'executable',
    command = 'lldb-vscode', -- adjust as needed
    name = "lldb"
}

dap.adapters.cpp = dap.adapters.lldb;

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html

        runInTerminal = false,

        -- 💀
        -- If you use `runInTerminal = true` and resize the terminal window,
        -- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
        -- To avoid that uncomment the following option
        -- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
        postRunCommands = {'process handle -p true -s false -n false SIGWINCH'}
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = {
    {
        name = "Rust-dap",
        type = "lldb",
        request = "launch",
        program = function()
            vim.fn.jobstart('cargo build') 
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
    },
}
