require 'core.options'  -- Load general options
require 'core.keymaps'  -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
 local default_color_scheme = 'catpuccin'
 local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

-- Define a table of theme modules
local themes = {
  catpuccin = 'plugins.themes.catpuccin',
  nord = 'plugins.themes.nord',
  onedark = 'plugins.themes.onedark',
}

-- Setup plugins
require('lazy').setup({
  require(themes[env_var_nvim_theme]),
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.ui',
  require 'plugins.refactor',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.none-ls',
  --require 'plugins.colorscheme',
  --require 'plugins.alpha',
  --require 'plugins.indent-blankline',
  require 'plugins.lazygit',
  require 'plugins.comment',
  require 'plugins.debug',
  require 'plugins.neo-tree',
  --require 'plugins.gitsigns',
  --require 'plugins.database',
  --require 'plugins.misc',
  require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
  --require 'plugins.aerial',
  require 'plugins.vim-tmux-navigator',
  --require 'plugins.barbar'    --conflicting with plugins.bufferline
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- Set color groups name example variable color/parameter color
-- vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#BD93F9' }) -- Purple
-- vim.api.nvim_set_hl(0, 'TSParameter', { fg = '#afafff' }) -- lightPurple
-- vim.api.nvim_set_hl(0, '@variable', { fg = '#afafff' }) -- Purple
-- vim.api.nvim_set_hl(0, '@variable', { fg = '#BD93F9' }) -- Purple

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Set custom diff highlight colors
vim.api.nvim_set_hl(0, 'DiffAdd', {fg = 'NONE', bg = '#2e4b2e', bold = true} -- Soft green for additions
vim.api.nvim_set_hl(0, 'DiffDelete', {fg = 'NONE', bg = '#4c1e15', bold = true} -- Soft red for deletions
vim.api.nvim_set_hl(0, 'DiffChange', {fg = 'NONE', bg = '#2b3e50', bold = true} -- Soft blue for change lines
vim.api.nvim_set_hl(0, 'DiffText', {fg = '#FABD2F', bg = '#1D2021', bold = true} -- Bright yellow for change character
      
-- japanese encoding to show the characters normally in the terminal
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,cp932,euc-jp,shift-jis'
