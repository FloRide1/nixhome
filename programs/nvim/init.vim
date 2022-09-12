""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"   This is the .vimrc file
"
" Maintainer:
"   Florian 'FloRide' Reimat
"
" Complete_version:
"   You can find the complete configuration,
"   including all the plugins used, here:
"   https://github.com/FloRide1/nixhome
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set encoding
set encoding=utf-8

" Coc TextEdit might fail if hidden is not set.
set hidden

" Coc Some server have issues with backup files
set nobackup
set nowritebackup

" Coc Give more space for displaying messages.
set cmdheight=2

" Clipboard
set clipboard=unnamedplus

" Coc Having longer update time leads is boring
set updatetime=300

" Coc don't pass messages to |ins-completion-menu|: [UNKNOW]
" set shortmess+=c

" Make backspace behave as expected 
set backspace=eol,indent,start

" Set the minimal amount of lignes under and above the cursor
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

" Disable bell completely
set visualbell
set t_vb=

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

set fillchars=vert:│

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
" set textwidth=79

" Disable preview window on completion
set completeopt=longest,menuone

" Enables syntax highlighting
syntax on

" Highlight current line
set cursorline

" Enhanced indent
set smartindent

" Add GDB Debugger
" packadd termdebug

" Gdb Config
" let g:termdebug_wide=1
" let g:termdebug_useFloatingHover = 0
" let g:termdebug_popup = 0
" let g:termdebug_wide = 163

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" Doxygen
" autocmd BufRead,BufNewFile *.h set filetype=c.doxygen

" Latex
" autocmd BufRead,BufNewFile *.tex set filetype=latex

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
set tabstop=4

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1

" Insert spaces instead of tabs
" set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Write as root, when you forgot to sudoedit
cnoreabbrev w!! w !sudo tee % >/dev/null

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" map ; to :
noremap ; :

" Tab Map
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-t> :tabnew<CR>
noremap <A-w> :tabclose<CR>
noremap <A-h> :tabprevious<CR>
noremap <A-l> :tabnext<CR>

" Split Screen
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Switch Screen during INSERT Mode
imap <C-w> <C-o><C-w>

" Map + and _ to Screen size
map + <C-W>+
map _ <C-W>-
map <M-.> <C-W><
map <M-,> <C-W>>

" Run make silently, then skip the 'Press ENTER to continue'
" noremap <leader>m :silent! :make! \| :redraw!<cr>
" noremap <leader>c :silent! :make! check \| :redraw!<cr>

" Map ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" nnoremap <silent> <C-n> :Over<CR>
" nnoremap <silent> <C-s> :Step<CR>
" nnoremap <silent> <C-b> :Break<CR>
" nnoremap <silent> <C-c> :Clear<CR>
" nnoremap <silent> <A-c> :Continue<CR>

" Fugitive + Merge
nmap <leader>hl :Gvdiffsplit!<CR>
nmap <C-h> :diffget //2<CR>
nmap <C-l> :diffget //3<CR>

" Telescope + Find
nnoremap <C-f> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>

" Lspcurrent_buffer_fuzzy_find
nnoremap <silent> K			<cmd>Lspsaga hover_doc<CR>
nnoremap <silent> gd		<cmd>Lspsaga preview_definition<CR>
nnoremap <silent> gi		<cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <C-k>		<cmd>Lspsaga signature_help<CR>

nnoremap <silent> <C-r>r	<cmd>Lspsaga rename<CR>

nnoremap <silent> <leader>f <cmd>Lspsaga code_action<CR>
vnoremap <silent> <leader>f <cmd>Lspsaga range_code_action<CR>

nnoremap <silent> gr		<cmd>lua vim.lsp.buf.references()<CR>

nnoremap <silent> <a-cr> <cmd>ToggleTerm direction=float<CR>
tnoremap <silent> <a-cr> <cmd>ToggleTerm direction=float<CR>

" Test
" nmap <silent> <C-t> :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <C-a> :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" Dap
" nnoremap <silent>

" Others
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <C-Space> <C-n>
" Trouble Toogle
nnoremap <silent> <space>q	<cmd>TroubleToggle<CR>

" Test
" nmap <silent> <C-t> :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <C-a> :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" Ulti Snips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"


""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options
""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoFormat
augroup autofmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Clang Format
" let g:clang_format#detect_style_file = 1
" let g:clang_format#auto_format = 1

" Git Gutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Colorizer
set termguicolors

" Dap
" let g:dap_virtual_text = v:true


""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua
""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect
lua<<EOF

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = ' ✚', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = ' ✹', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = ' -', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
require("colorizer").setup()
require("toggleterm").setup()

require("trouble").setup({ 
	icons = true,
	signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
	use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})

require('lspsaga').setup {
  debug = true,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",

  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },

  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },

  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },

  border_style = "single",
  definition_preview_icon = "  ",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}


local cmp = require("cmp")
local luasnip = require("luasnip")
-- require("todo-comments").setup()

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'buffer', max_item_count = 5 },
		{ name = 'luasnip'}
	},

	mapping = {
	['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
			  if cmp.visible() then
				cmp.select_next_item()
			  elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			  elseif has_words_before() then
				cmp.complete()
			  else
				fallback()
			  end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
			  if cmp.visible() then
				cmp.select_prev_item()
			  elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			  else
				fallback()
			  end
			end, { "i", "s" }),
    },
})



--[[
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', 
{
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer' }}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', 
{
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'path' }, { name = 'cmdline' } }
})
--]]


local on_attach = function(client, bufnr)
	vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
end


local servers = { 'rnix', 'tsserver', 'rust_analyzer', 'jdtls' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/floride/.local/share/nvim/mason/bin/omnisharp"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
	on_attach = on_attach,
	capabilities = capabilities,
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = { "omnisharp" },
}

local dap = require('dap')
vim.fn.sign_define('DapBreakpoint',			{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected',	{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',			{text='', texthl='', linehl='', numhl=''})

vim.keymap.set('n', '<C-b>', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<C-o>', function() require"dap".step_out() end)
vim.keymap.set('n', "<C-s>", function() require"dap".step_into() end)
vim.keymap.set('n', '<C-n>', function() require"dap".step_over() end)
vim.keymap.set('n', '<A-c>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<C-c>', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>dR', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<C-k>', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<A-k>', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set('n', '<leader>m', function() require("dapui").eval() end)

require("nvim-dap-virtual-text").setup()
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
      {
        -- You can change the order of elements in the sidebar
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
      },
      {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
      },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

-- Hide statuline inside dap's buffers
vim.cmd([[
autocmd BufEnter dapui* set statusline=\ 
autocmd BufEnter dap-repl set statusline=\ 
]])

-- call dap-ui automatically from dap when launching/closing a debugging session
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


  dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg';
    args = {'--interpreter=vscode'}
  }

  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        local cwd = vim.fn.getcwd()
        local d = vim.fn.fnamemodify(cwd, ":t")
        return vim.fn.input('Path to dll: ', cwd .. '/bin/Debug/net6.0/' .. d .. '.dll', 'file')
      end,
    },
    {
      type = "netcoredbg",
      name = "attach - netcoredbg",
      request = "attach",
      processId = function()
        local pid = require('dap.utils').pick_process()
        vim.fn.setenv('NETCOREDBG_ATTACH_PID', pid)
        return pid
      end,
    },
  }

require("tokyonight").setup({
	style = "night",

	transparent = false, 
	terminal_colors = true, 
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark", 
		floats = "dark",
	},
	on_colors = function(colors)
		colors.gitSigns = {
			add = "#9ece6a",
			change = "#bbbb00",
			delete = "#f7768e"
		}
	end,
	sidebars = { "qf", "help" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
})


EOF


""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme tokyonight-night
let g:airline_powerline_fonts = 1
let g:airline_theme = 'purify'
