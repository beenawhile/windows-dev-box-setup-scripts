require "paq" {
    -- Package Manage itself
    "savq/paq-nvim";                  

    -- Auto Pair 
    "jiangmiao/auto-pairs";

    -- Commentary
    "tpope/vim-commentary";

    -- Color Scheme
    'Mofiqul/dracula.nvim';

    -- CSS Color Preview
    'ap/vim-css-color';

    -- Status Bar
    'vim-airline/vim-airline';
    'vim-airline/vim-airline-themes';

    -- Fuzzy finder
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    {'nvim-telescope/telescope.nvim',
	requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/pleanary.nvim'}}
    };

    -- File explorere with icons
    'kyazdani42/nvim-tree.lua';
    'kyazdani42/nvim-web-devicons';

    -- Git
    'tpope/vim-fugitive';
    'airblade/vim-gitgutter';

    -- Auto completion and Snippets
    -- - Code
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';
    'hrsh7th/vim-vsnip-integ';
    -- - Command Line
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';

    -- Lsp plugin based on neovim built-in lsp
    'neovim/nvim-lspconfig';
    'tami5/lspsaga.nvim';

    -- Flutter tools
    {'akinsho/flutter-tools.nvim', requires='nvim-lua/plenary.nvim'};

    -- Dart syntax highlight and formatting
    'dart-lang/dart-vim-plugin';

    -- Tmux navigator
    'christoomey/vim-tmux-navigator';
}
