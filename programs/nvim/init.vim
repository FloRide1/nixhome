""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:nvim
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
set expandtab

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

" Switch Screen during INSERT Mode
imap <C-w> <C-o><C-w>

" Map ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Map + and _ to Screen size
map + <C-W>+
map _ <C-W>-
map <M-.> <C-W><
map <M-,> <C-W>>

" Fugitive + Merge
nmap <leader>hl :Gvdiffsplit!<CR>
nmap <C-h> :diffget //2<CR>
nmap <C-l> :diffget //3<CR>

" The rest of the mappings is in which-key.lua file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin options
""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoFormat
augroup autofmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END

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

-- Local lua (Only for temporary usage)

EOF


""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme carbonfox
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'purify'
