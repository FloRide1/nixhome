{ config, pkgs, lib, vimUtils, ... }:

let
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
      };
    };

  # always installs latest version
  plugin = pluginGit "HEAD";
in {
  programs.neovim = {
    enable = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # UI
      nvim-colorizer-lua
      vim-airline
      vim-airline-themes
      nvim-web-devicons
      lsp-colors-nvim
      trouble-nvim
      # todo-nvim

      # Navigation
      nvim-treesitter
      telescope-nvim
      which-key-nvim
      vim-eunuch

      # Git
      vim-gitgutter
      vim-fugitive

      # LSP
      (plugin "neovim/nvim-lspconfig")
      (plugin "williamboman/nvim-lsp-installer")

      # Theme
      (plugin "Metallum19/purify-vim")
      tender-vim

      # Completion
      nvim-cmp
      cmp_luasnip
      cmp-nvim-lsp
      cmp-cmdline
      cmp-path
      cmp-buffer
      (plugin "hrsh7th/cmp-nvim-lsp-signature-help")

      # Others
      glow-nvim
      # ultisnips
      luasnip
      vimtex
      neoformat
      vim-addon-nix

      # vim-clang-format
      # nvim-dap
      # nvim-dap-virtual-text
      # vim-test
    ];

    # https://github.com/breuerfelix/nixos/blob/main/shell/vim/init.nix
    extraConfig =
      builtins.concatStringsSep "\n" [ (lib.strings.fileContents ./init.vim) ];
  };
}
