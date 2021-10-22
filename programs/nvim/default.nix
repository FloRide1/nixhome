{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		vimAlias = true;
		extraConfig = ''

			""""""""""""""""""""""""""""""""""""""""""""""""""
			" Description:
			"   This is the .vimrc file
			"
			" Maintainer:
			"	Florian 'FloRide' Reimat
			"
			" Complete_version:
			"   You can find the complete configuration,
			"   including all the plugins used, here:
			"   https://github.com/FloRide1/dotfiles
			"
			" Acknowledgements:
			"   Several elements of this .vimrc come from Pierre Bourdon's config
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
			set textwidth=79

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

			""""""""""""""""""""""""""""""""""""""""""""""""""
			" Indentation options
			""""""""""""""""""""""""""""""""""""""""""""""""""

			" The length of a tab
			" This is for documentation purposes only,
			" do not change the default value of 8, ever.
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

			" Split Screen
			nmap <silent> <A-Up> :wincmd k<CR>
			nmap <silent> <A-Down> :wincmd j<CR>
			nmap <silent> <A-Left> :wincmd h<CR>
			nmap <silent> <A-Right> :wincmd l<CR>

			imap <C-w> <C-o><C-w>

			map + <C-W>+
			map - <C-W>-
			map <M-.> <C-W><
			map <M-,> <C-W>>

			" Run make silently, then skip the 'Press ENTER to continue'
			noremap <leader>m :silent! :make! \| :redraw!<cr>

			" Map ESC to exit terminal mode
			tnoremap <Esc> <C-\><C-n>
			nnoremap <silent> <C-b> :Break<CR>
			nnoremap <silent> <C-c> :Clear<CR>
			nnoremap <silent> <F5> :Continue<CR>

			""""""""""""""""""""""""""""""""""""""""""""""""""
			" Persistence options
			""""""""""""""""""""""""""""""""""""""""""""""""""

			let g:termdebug_popup = 0
			let g:termdebug_wide = 163

			""""""""""""""""""""""""""""""""""""""""""""""""""
			" Plugin mappings and options
			""""""""""""""""""""""""""""""""""""""""""""""""""
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

			inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
			inoremap <C-Space> <C-n>

			" Use <c-space> to trigger completion.
			"inoremap <silent><expr> <c-space> coc#refresh()

			" Symbol renaming.
			nmap <c-r>r <Plug>(coc-rename)

			" Use K to show documentation in preview window.
			nnoremap <silent> K :call <SID>show_documentation()<CR>

			function! s:show_documentation()
			if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
					elseif (coc#rpc#ready())
					call CocActionAsync('doHover')
			else
				execute '!' . &keywordprg . " " . expand('<cword>')
					endif
					endfunction

					" Highlight the symbol and its references when holding the cursor.
					autocmd CursorHold * silent call CocActionAsync('highlight')

					set statusline^=%{coc#status()}%{get(b:,'coc_current_function','\')}
			""""""""""""""""""""""""""""""""""""""""""""""""""
			" Theme
			""""""""""""""""""""""""""""""""""""""""""""""""""
			colorscheme tender
			let g:airline_powerline_fonts = 1
			let g:airline_theme = 'tender'
			'';



		plugins = with pkgs.vimPlugins; [ 
			vim-airline
			vim-airline-themes
			tender-vim
			vim-devicons
			vim-clang-format
			vim-gitgutter
			ultisnips
			vimtex
			coc-nvim
			coc-pairs
			coc-yaml
			coc-clangd
			which-key-nvim
			nvim-colorizer-lua
		];
	};
}
