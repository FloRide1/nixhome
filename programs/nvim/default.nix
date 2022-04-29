{ config, pkgs, lib, vimUtils,  ... }:

let
	# installs a vim plugin from git with a given tag / branch
	pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
		pname = "${lib.strings.sanitizeDerivationName repo}";
		version = ref;
		src = builtins.fetchGit {
			url = "https://github.com/${repo}.git";
			ref = ref;
		};
	};

	# always installs latest version
	plugin = pluginGit "HEAD";
in
{
	programs.neovim = {
		enable = true;
		vimAlias = true;

		plugins = with pkgs.vimPlugins; 
		[ 
			vim-airline
			vim-airline-themes
			tender-vim
			vim-devicons
			vim-clang-format
			vim-gitgutter
			ultisnips
			vimtex
			nvim-treesitter
			telescope-nvim
			which-key-nvim
			nvim-colorizer-lua
			vim-fugitive
			vim-eunuch
			vim-dadbod
			vim-dadbod-ui
			(plugin "neovim/nvim-lspconfig")
			# (plugin "williamboman/nvim-lsp-installer")
			(plugin "puremourning/vimspector")
		];

		# https://github.com/breuerfelix/nixos/blob/main/shell/vim/init.nix
		extraConfig = builtins.concatStringsSep "\n" [
			(lib.strings.fileContents ./init.vim)
		];
	};
}
