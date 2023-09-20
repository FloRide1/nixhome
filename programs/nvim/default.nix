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

  path = ".config/nixpkgs";
  nvim_folder = "${path}/programs/nvim";
  nvim_config = "~/${nvim_folder}/init.vim";
  nvim_lua = "${nvim_folder}/lua";

  # https://github.com/breuerfelix/nixos/blob/main/shell/vim/init.nix
  # builtins.concatStringsSep "\n" [ (lib.strings.fileContents ./init.vim) ];

in {
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraConfig = ''
      lua path = os.getenv('HOME') .. "/${nvim_lua}"

      source ${nvim_config}
      luafile ~/${nvim_lua}/init.lua
    '';

    plugins = with pkgs.vimPlugins; [
      # UI
      nvim-colorizer-lua
      (plugin "kyazdani42/nvim-web-devicons")
      (plugin "folke/lsp-colors.nvim")
      (plugin "folke/trouble.nvim")
      (plugin "tami5/lspsaga.nvim")
      todo-comments-nvim
      lualine-nvim

      # Navigation
      nvim-treesitter
      nvim-treesitter.withAllGrammars
      telescope-nvim
      which-key-nvim
      vim-eunuch

      # Git
      (plugin "lewis6991/gitsigns.nvim")
      vim-fugitive
      # vim-gitgutter

      # LSP
      (plugin "neovim/nvim-lspconfig")
      nvim-jdtls

      # DAP
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      telescope-dap-nvim

      # Theme
      nightfox-nvim
      (plugin "folke/tokyonight.nvim")
      (plugin "Metallum19/purify-vim")
      tender-vim

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-nvim-lsp-signature-help
      cmp-path
      cmp-buffer
      cmp_luasnip
      cmp-cmdline

      # Tests
      (plugin "vim-test/vim-test")
      (plugin "nvim-lua/plenary.nvim")
      (plugin "nvim-neotest/neotest-plenary")
      (plugin "antoinemadec/FixCursorHold.nvim")
      (plugin "nvim-neotest/neotest")
      (plugin "nvim-neotest/neotest-vim-test")
      (plugin "Issafalcon/neotest-dotnet")
      (plugin "rouge8/neotest-rust")
      # vim-test

      # Others
      (plugin "williamboman/mason.nvim")
      (plugin "williamboman/mason-lspconfig.nvim")
      (plugin "akinsho/toggleterm.nvim")
      markdown-preview-nvim
      # glow-nvim
      # ultisnips
      luasnip
      vimtex
      neoformat
      vim-addon-nix
      vim-toml
      # vim-clang-format
    ];

  };
}
