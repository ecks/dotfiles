-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
return require('packer').startup(function()
          use 'wbthomason/packer.nvim'       -- Package manager
          use 'tpope/vim-unimpaired' -- makes switching between tabs easier
          use 'tpope/vim-surround' -- cs to change surrounding text
          use 'tpope/vim-commentary' -- comment out blocks of text
        
          use 'morhetz/gruvbox'

          use 'vim-airline/vim-airline' -- statusline
          use 'vim-airline/vim-airline-themes'
          
          use 'sjl/gundo.vim' -- visualize your vim undo tree
          
          use 'junegunn/fzf' -- fuzzy finding
          use 'junegunn/fzf.vim' -- fuzzy finding
          
          use 'neovim/nvim-lspconfig'
          use 'nvim-lua/completion-nvim'
          
          use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
          
          
          use 'nvim-treesitter/nvim-treesitter'
          use 'nvim-treesitter/playground'
          use 'nvim-treesitter/nvim-treesitter-textobjects'
          
          use 'vimwiki/vimwiki'
          use 'michal-h21/vim-zettel'
          
          use 'samoshkin/vim-mergetool'
          
          use 'mattn/vim-goimports'
          
          use 'tpope/vim-fugitive'
          
          use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
          use 'tjdevries/colorbuddy.nvim'
          
          use 'moll/vim-bbye'
          
          use 'easymotion/vim-easymotion'
          
          use 'svermeulen/nvim-moonmaker'
          use 'svermeulen/vimpeccable'
	  use 'justinmk/vim-dirvish'
end)
