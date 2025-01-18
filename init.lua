vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
  ensure_installed = { 
    'lua',
    'javascript',
    'vim',
    'vimdoc',
    'query',
    'markdown',
    'markdown_inline'
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true }
})














