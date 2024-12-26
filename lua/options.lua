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