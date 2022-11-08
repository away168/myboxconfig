--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
-- https://mattermost.com/blog/turning-neovim-into-a-full-fledged-code-editor-with-lua/
--
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

require'nvim-tree'.setup {}
<<<<<<< HEAD
require('lualine').setup {
  options = { theme  = 'dracula'}
}
=======

vim.opt.conceallevel = 0
>>>>>>> da49274fb9723bbe5ff88f4a2688ecf723ed8d6f
