-- ==================== General ====================
--  map leader before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- ==================== Setting Options ====================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a' -- enable mouse
vim.opt.showmode = false -- don't show mode, it's already in the status line
vim.opt.breakindent = true -- enable break indent
vim.opt.undofile = true -- save undo history
vim.opt.ignorecase = true -- enable case-insensitive searching 
vim.opt.smartcase = true -- enable case-sensitive searching if \C or 1+ capital letters in the search term
vim.opt.signcolumn = 'yes' -- enable sign column (gutter)
vim.opt.updatetime = 250 -- displays symbol under cursor highlight sooner
vim.opt.timeoutlen = 300 -- displays which-key popup sooner
vim.opt.splitright = true -- new vertical splits right
vim.opt.splitbelow = true -- new horizontal splits below
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- sets how to display whitespace characters
vim.opt.inccommand = 'split' -- preview substitutions live in split
vim.opt.cursorline = true -- highlight current cursor line
vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor

vim.schedule(function() -- schedule the setting after `UiEnter` because it can increase startup-time
  vim.opt.clipboard = 'unnamedplus' -- sync clipboard between OS and Neovim (:help 'clipboard')
end)

-- ==================== Basic Keymaps ====================
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- might not work in some terminals/tmux

-- CTRL+<h | j | k | l> and CTRL+<left | right | up | down> to switch between windows. See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ==================== Basic Autocommands ====================
-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ==================== Install `lazy.nvim` plugin manager ====================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require 'lazy-plugins'


-- The line beneath this is called 'modeline'. See ':help modeline'
-- vim: ts=2 sts=2 sw=2 et