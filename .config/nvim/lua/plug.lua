-- [[ plug.lua ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('config')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'        -- filesystem icons
  }

  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }  
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'goolord/alpha-nvim',                            -- startup
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
end) 
     
