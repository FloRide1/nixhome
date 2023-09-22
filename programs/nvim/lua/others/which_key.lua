local which_key = require('which-key')

local setup = {
    window = {
        border = "rounded",
    },
}

which_key.setup(setup)

-- Normal
local opts = {
    mode = "n",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

local keymaps = {
    ["<A-1>"] = { "1gt", "Move to Tab 1" },
    ["<A-2>"] = { "2gt", "Move to Tab 2" },
    ["<A-3>"] = { "3gt", "Move to Tab 3" },
    ["<A-4>"] = { "4gt", "Move to Tab 4" },
    ["<A-5>"] = { "5gt", "Move to Tab 5" },
    ["<A-6>"] = { "6gt", "Move to Tab 6" },
    ["<A-7>"] = { "7gt", "Move to Tab 7" },
    ["<A-8>"] = { "8gt", "Move to Tab 8" },
    ["<A-9>"] = { "9gt", "Move to Tab 9" },
    ["<A-t>"] = { "<cmd>:tabnew<cr>", "Create a new Tab" },
    ["<A-w>"] = { "<cmd>:tabclose<cr>", "Close the current Tab" },
    ["<A-h>"] = { "<cmd>:tabprevious<cr>", "Move to the previous Tab" },
    ["<A-l>"] = { "<cmd>:tabnext<cr>", "Move to the next Tab" },

    ["<C-f>"] = { "<cmd>:Telescope current_buffer_fuzzy_find<cr>", "Find Text in Current Buffer" }, 

    K = { "<cmd>:Lspsaga hover_doc<cr>", "Show doc of hover" }, 

    ["<space>"] = {
        name = "Lsp",
        ["<space>"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        f = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        R = { "<cmd>lua vim.lsp.buf.references()<cr>", "Show Reference" },
        i = { "<cmd>Lspsaga lsp_finder<cr>", "Show Implementation" },
        d = { "<cmd>Lspsaga preview_definition<cr>", "Show Definition" },
        k =  { "<cmd>Lspsaga signature_help<cr>", "Help with signature" },
    },

    ["<leader>"] = {
        name = "<Leader>", 
        f = {
            name = "Telescope", 
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            g = { "<cmd>Telescope live_grep<cr>", "Find Text in Workspace" },
            o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            b = { "<cmd>Telescope buffers<cr>", "Switch Buffer" },
            r = { "<cmd>Telescope resume<cr>", "Resume Last Search" },
            t = { "<cmd>TodoTelescope<cr>", "Find Todo's"},
        },

        t = {
            name = "NeoTest",
            t = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle NeoTest" },
            f = { "<cmd>lua require('neotest').run.run()<cr>", "Launch file test" },
            h = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%')<cr>", "Launch hover test" },
        },
    },

    -- Dap
    ["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", "DAP Continue / Start" },
    ["<F3>"] = { "<cmd>lua require('dap').terminate()<cr>", "DAP Stop" },
    ["<F4>"] = { "<cmd>lua require('dap').restart()<cr>", "DAP Restart" },
    ["<S-F5>"] = { "<cmd>lua require('dap').run_last()<cr>", "DAP Run Last" },
    ["<F8>"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "DAP Toggle Breakpoint" },
    ["<F10>"] = { "<cmd>lua require('dap').step_over()<cr>", "DAP Step Over" },
    ["<F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "DAP Step Into" },
    ["<S-F11>"] = { "<cmd>lua require('dap').step_out()<cr>", "DAP Step Out" },


    -- Also on Terminal mode
    ["<A-CR>"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Floating Term" },
}

which_key.register(keymaps, opts)

-- Terminal
local opts = {
    mode = "t",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

local keymaps = {
    -- Also on Normal mode
    ["<A-CR>"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Floating Term" },
}

which_key.register(keymaps, opts)
