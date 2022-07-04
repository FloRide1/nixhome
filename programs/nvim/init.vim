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
nnoremap <silent> K			<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd		<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi		<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k>		<cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <silent> <C-r>r	<cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> gr		<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>e	<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

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
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme purify
let g:airline_powerline_fonts = 1
let g:airline_theme = 'purify'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua
""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect
lua<<EOF

require("colorizer").setup()
require("trouble").setup()


local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
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


-- require("todo-comments").setup()
local lsp_installer = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
end

lsp_installer.on_server_ready(function(server)
	local opts = {}
	opts.on_attach = on_attach
	server:setup(opts)
	vim.cmd [[ do User LspAttachBuffers ]]
end)

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

local servers = { 'rnix', 'tsserver' }

for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end


--[[
local dap = require('dap')
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = {os.getenv('HOME') .. '/Documents/Others/vscode-node-debug2/out/src/nodeDebug.js'},
}


dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint',			{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected',	{text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',			{text='', texthl='', linehl='', numhl=''})

local function dap_attach()
  print("attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

local function dap_attachToRemote()
  print("Remote attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      address = "127.0.0.1",
      port = 9229,
      localRoot = vim.fn.getcwd(),
      remoteRoot = "/home/vcap/app",
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

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
vim.keymap.set('n', '<leader>da', dap_attach)
vim.keymap.set('n', '<leader>dA', dap_attachToRemote)
vim.keymap.set('n', '<C-k>', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<A-k>', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

require("nvim-dap-virtual-text").setup()
--]]

EOF

