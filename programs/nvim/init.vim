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
packadd termdebug

" Gdb Config
let g:termdebug_wide=1
let g:termdebug_useFloatingHover = 0

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
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-t> :tabnew<CR>
map <A-w> :tabclose<CR>

" Split Screen
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

imap <C-w> <C-o><C-w>

map + <C-W>+
map _ <C-W>-
map <M-.> <C-W><
map <M-,> <C-W>>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <leader>m :silent! :make! \| :redraw!<cr>
noremap <leader>c :silent! :make! check \| :redraw!<cr>

" Map ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> <C-n> :Over<CR>
nnoremap <silent> <C-s> :Step<CR>
nnoremap <silent> <C-b> :Break<CR>
nnoremap <silent> <C-c> :Clear<CR>
nnoremap <silent> <A-c> :Continue<CR>

" Fugitive + Merge
nmap <leader>hl :Gvdiffsplit!<CR>
nmap <C-h> :diffget //2<CR>
nmap <C-l> :diffget //3<CR>

" Telescope + Find
nmap <C-f> :Telescope find_files<CR>
nmap <C-g> :Telescope live_grep<CR>

" Lsp
nnoremap <silent> K			<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd		<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi		<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k>		<cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <silent> <C-r>r	<cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> gr		<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>e	<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <space>q	<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" Others
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <C-Space> <C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:termdebug_popup = 0
let g:termdebug_wide = 163

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

" Ulti Snips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Git Gutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme purify
let g:airline_powerline_fonts = 1
let g:airline_theme = 'purify'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua
""""""""""""""""""""""""""""""""""""""""""""""""""
lua<<EOF
local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
end

local lsp_installer = require("nvim-lsp-installer")

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
	}
end
EOF

